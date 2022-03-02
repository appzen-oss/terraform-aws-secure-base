
data "aws_caller_identity" "current" {}
data "aws_iam_account_alias" "current" {}
data "aws_region" "current" {}

#
#locals {
#  flow_logs_use_s3 = var.vpc_flow_logs_destination_type == "s3"
#}

locals {
  cloudtrail_destination = join("/", [local.s3_bucket_arn, trim(var.cloudtrail_s3_key_prefix, "/")])
  config_destination     = join("/", [local.s3_bucket_arn, trim(var.config_s3_bucket_key_prefix, "/")])
  flow_logs_destination  = join("/", [local.s3_bucket_arn, trim(var.vpc_flow_logs_s3_key_prefix, "/")])
  member_account_ids     = sort(data.aws_organizations_organization.org.accounts[*].id)
  org_id                 = data.aws_organizations_organization.org.id
}

data "aws_organizations_organization" "org" {
  # count = local.enable
  provider = aws.org-master
}

## S3 Bucket policies
# Support all AWS infrastructure services
#   AWS Config, CloudTrail, VPC Flow Logs
#   Figure out standard paths or allow customization
#     GuardDuty Findings, DNS Logs
# https://stackoverflow.com/questions/62831874/terrafrom-aws-iam-policy-document-condition-correct-syntax

# --------------------------------------------------------------------------------------------------
# Apply policies to enforce SSL connections.
# https://docs.aws.amazon.com/config/latest/developerguide/s3-bucket-ssl-requests-only.html
# https://aws.amazon.com/premiumsupport/knowledge-center/s3-bucket-policy-for-config-rule/
# --------------------------------------------------------------------------------------------------
data "aws_iam_policy_document" "s3_secure" {
  count = local.enable
  statement {
    sid     = "ForceSSLOnlyAccess"
    actions = ["s3:*"]
    effect  = "Deny"
    resources = [
      local.s3_bucket_arn,
      "${local.s3_bucket_arn}/*"
    ]
    condition {
      test     = "Bool"
      variable = "aws:SecureTransport"
      values   = ["false"]
    }
    principals {
      type        = "*"
      identifiers = ["*"]
    }
  }
}

## Since only AWS services do writes, should not need these statements
#data "aws_iam_policy_document" "bucket_policy" {
#  count = local.enable ? 1 : 0
#
#  dynamic "statement" {
#    for_each = var.allow_encrypted_uploads_only ? [1] : []
#    content {
#      sid       = "DenyIncorrectEncryptionHeader"
#      effect    = "Deny"
#      actions   = ["s3:PutObject"]
#      resources = ["${local.bucket_arn}/*"]
#      principals {
#        identifiers = ["*"]
#        type        = "*"
#      }
#      condition {
#        test     = "StringNotEquals"
#        values   = [var.sse_algorithm]
#        variable = "s3:x-amz-server-side-encryption"
#      }
#    }
#  }
#
#  dynamic "statement" {
#    for_each = var.allow_encrypted_uploads_only ? [1] : []
#    content {
#      sid       = "DenyUnEncryptedObjectUploads"
#      effect    = "Deny"
#      actions   = ["s3:PutObject"]
#      resources = ["${local.bucket_arn}/*"]
#      principals {
#        identifiers = ["*"]
#        type        = "*"
#      }
#      condition {
#        test     = "Null"
#        values   = ["true"]
#        variable = "s3:x-amz-server-side-encryption"
#      }
#    }
#  }
#
#  dynamic "statement" {
#    for_each = keys(var.privileged_principal_arns)
#    content {
#      sid     = "AllowPrivilegedPrincipal[${statement.key}]" # add indices to Sid
#      actions = var.privileged_principal_actions
#      resources = distinct(flatten([
#        "arn:aws:s3:::${join("", aws_s3_bucket.self.*.id)}",
#        formatlist("arn:aws:s3:::${join("", aws_s3_bucket.self.*.id)}/%s*", var.privileged_principal_arns[statement.value]),
#      ]))
#      principals {
#        type        = "AWS"
#        identifiers = [statement.value]
#      }
#    }
#  }
#}
#

# --------------------------------------------------------------------------------------------------
# Apply policies for CloudTrail log delivery based on AWS CloudTrail User Guide.
# https://docs.aws.amazon.com/awscloudtrail/latest/userguide/create-s3-bucket-policy-for-cloudtrail.html
# --------------------------------------------------------------------------------------------------
data "aws_iam_policy_document" "s3_cloud_trail" {
  count                   = local.enable
  source_policy_documents = [join("", data.aws_iam_policy_document.s3_secure.*.json)]
  statement {
    sid     = "AWSCloudTrailAclCheck20150319"
    actions = ["s3:GetBucketAcl"]
    principals {
      type        = "Service"
      identifiers = ["cloudtrail.amazonaws.com"]
    }
    resources = [local.s3_bucket_arn]
    #condition {
    #  test     = "StringEquals"
    #  variable = "aws:SourceArn"
    #  values   = formatlist("arn:aws:cloudtrail:%s:%s:trail/*", data.aws_region.current.name, local.member_account_ids)
    #}
  }
  statement {
    sid     = "AWSCloudTrailWrite20150319"
    actions = ["s3:PutObject"]
    principals {
      type        = "Service"
      identifiers = ["cloudtrail.amazonaws.com"]
    }
    resources = concat(
      formatlist("%s/AWSLogs/%s/*/CloudTrail*", local.cloudtrail_destination, [local.org_id]),
      formatlist("%s/AWSLogs/%s/CloudTrail*", local.cloudtrail_destination, local.member_account_ids)
      )
    condition {
      test     = "StringEquals"
      variable = "s3:x-amz-acl"
      values   = ["bucket-owner-full-control"]
    }
    #condition {
    #  test     = "StringEquals"
    #  variable = "aws:SourceArn"
    #  values   = formatlist("arn:aws:cloudtrail:%s:%s:trail/*", data.aws_region.current.name, local.member_account_ids)
    #}
  }
}

# --------------------------------------------------------------------------------------------------
# Apply policies for AWS Config log delivery based on AWS Config Developer Guide.
# https://docs.aws.amazon.com/config/latest/developerguide/s3-bucket-policy.html
# --------------------------------------------------------------------------------------------------
# Also supported:
#   SourceArn = arn:aws:config:<region>:<account id>:*
data "aws_iam_policy_document" "s3_config" {
  count                   = local.enable
  source_policy_documents = [join("", data.aws_iam_policy_document.s3_cloud_trail.*.json)]
  # Access for config service
  statement {
    sid     = "AWSConfigBucketPermissionsCheck"
    actions = ["s3:GetBucketAcl"]
    principals {
      type        = "Service"
      identifiers = ["config.amazonaws.com"]
    }
    resources = [local.s3_bucket_arn]
    condition {
      test     = "StringEquals"
      variable = "AWS:SourceAccount"
      values   = local.member_account_ids
    }
  }
  statement {
    sid     = "AWSConfigBucketExistenceCheck"
    actions = ["s3:ListBucket"]
    principals {
      type        = "Service"
      identifiers = ["config.amazonaws.com"]
    }
    resources = [local.s3_bucket_arn]
    condition {
      test     = "StringEquals"
      variable = "AWS:SourceAccount"
      values   = local.member_account_ids
    }
  }
  statement {
    sid     = "AWSConfigBucketDelivery"
    actions = ["s3:PutObject"]
    principals {
      type        = "Service"
      identifiers = ["config.amazonaws.com"]
    }
    resources = formatlist("%s/AWSLogs/%s/Config/*", local.config_destination, local.member_account_ids)
    condition {
      test     = "StringEquals"
      variable = "s3:x-amz-acl"
      values   = ["bucket-owner-full-control"]
    }
    condition {
      test     = "StringEquals"
      variable = "AWS:SourceAccount"
      values   = local.member_account_ids
    }
  }
  # ?? Access for AWS accounts - Unclear if these are needed
  statement {
    sid = "AWSConfigBucketPermissionsCheckForMemberAccounts"
    principals {
      type        = "AWS"
      identifiers = formatlist("arn:aws:iam::%s:root", local.member_account_ids)
    }
    actions   = ["s3:GetBucketAcl"]
    resources = [local.s3_bucket_arn]
  }
  statement {
    sid = "AWSConfigBucketExistenceCheckForMemberAccounts"
    principals {
      type        = "AWS"
      identifiers = formatlist("arn:aws:iam::%s:root", local.member_account_ids)
    }
    actions   = ["s3:ListBucket", "s3:GetBucketLocation"]
    resources = [local.s3_bucket_arn]
  }
  statement {
    sid = "AWSConfigBucketDeliveryForMemberAccounts"
    principals {
      type        = "AWS"
      identifiers = formatlist("arn:aws:iam::%s:root", local.member_account_ids)
    }
    actions   = ["s3:PutObject"]
    resources = formatlist("%s/AWSLogs/%s/Config/*", local.config_destination, local.member_account_ids)
    condition {
      test     = "StringEquals"
      variable = "s3:x-amz-acl"
      values   = ["bucket-owner-full-control"]
    }
  }
}

# --------------------------------------------------------------------------------------------------
# Apply policies for AWS Config log delivery based on Amazon Virtual Private Cloud User Guide.
# This policy is necessary only when the log destination of VPC Flow Logs is set to S3.
# https://docs.aws.amazon.com/vpc/latest/userguide/flow-logs-s3.html#flow-logs-s3-permissions
# --------------------------------------------------------------------------------------------------
data "aws_iam_policy_document" "s3_flow_logs" {
  count                   = local.enable
  source_policy_documents = [join("", data.aws_iam_policy_document.s3_config.*.json)]
  statement {
    sid     = "AWSLogDeliveryAclCheck"
    actions = ["s3:GetBucketAcl", "s3:ListBucket"]
    principals {
      type        = "Service"
      identifiers = ["delivery.logs.amazonaws.com"]
    }
    resources = [local.s3_bucket_arn]
    condition {
      test     = "StringEquals"
      variable = "AWS:SourceAccount"
      values   = local.member_account_ids
    }
    #condition {
    #  test     = "ArnLike"
    #  variable = "aws:SourceArn"
    #  values   = formatlist("arn:aws:logs:%s:%s:*", data.aws_region.current.name, local.member_account_ids)
    #}
  }
  statement {
    sid     = "AWSLogDeliveryWrite"
    actions = ["s3:PutObject"]
    principals {
      type        = "Service"
      identifiers = ["delivery.logs.amazonaws.com"]
    }
    resources = formatlist("%s/AWSLogs/%s/vpcflowlogs/*", local.flow_logs_destination, local.member_account_ids)
    condition {
      test     = "StringEquals"
      variable = "s3:x-amz-acl"
      values   = ["bucket-owner-full-control"]
    }
    condition {
      test     = "StringEquals"
      variable = "AWS:SourceAccount"
      values   = local.member_account_ids
    }
    #condition {
    #  test     = "ArnLike"
    #  variable = "aws:SourceArn"
    #  values   = formatlist("arn:aws:logs:%s:%s:*", data.aws_region.current.name, local.member_account_ids)
    #}
  }
}

# https://docs.aws.amazon.com/guardduty/latest/ug/guardduty_exportfindings.html
# kms key and s3 bucket must be in same region
# s3_guardduty
# "guardduty.amazonaws.com"
# path: /AWSLogs/111122223333/GuardDuty/Region
#data "aws_iam_policy_document" "s3_guard_duty" {
#  count       = local.enable
#  source_json = join("", data.aws_iam_policy_document.s3_flow_logs.*.json)
#  statement {
#    sid     = "AllowGuardDutygetBucketLocation"
#  statement {
#    sid     = "AllowGuardDutyPutObject"
#  statement {
#    sid     = "DenyUnencryptedUploads"
#  statement {
#    sid     = "DenyIncorrectHeader"
#{
#    "Version": "2012-10-17",
#    "Statement": [
#        {
#            "Sid": "AllowGuardDutygetBucketLocation",
#            "Effect": "Allow",
#            "Principal": {
#                "Service": "guardduty.amazonaws.com"
#            },
#            "Action": "s3:GetBucketLocation",
#            "Resource": "arn:aws:s3:::myBucketName",
#            "Condition": {
#                "StringEquals": {
#                    "aws:SourceAccount": "111122223333",
#                    "aws:SourceArn": "arn:aws:guardduty:Region:111122223333:detector/SourceDetectorID"
#
#                }
#            }
#        },
#        {
#            "Sid": "AllowGuardDutyPutObject",
#            "Effect": "Allow",
#            "Principal": {
#                "Service": "guardduty.amazonaws.com"
#            },
#            "Action": "s3:PutObject",
#            "Resource": "arn:aws:s3:::myBucketName/[optional prefix]/*",
#            "Condition": {
#                "StringEquals": {
#                    "aws:SourceAccount": "111122223333",
#                    "aws:SourceArn": "arn:aws:guardduty:Region:111122223333:detector/SourceDetectorID"
#
#                }
#            }
#        },
#        {
#            "Sid": "DenyUnencryptedUploadsThis is optional",
#            "Effect": "Deny",
#            "Principal": {
#                "Service": "guardduty.amazonaws.com"
#            },
#            "Action": "s3:PutObject",
#            "Resource": "arn:aws:s3:::myBucketName/[optional prefix]/*",
#            "Condition": {
#                "StringNotEquals": {
#                    "s3:x-amz-server-side-encryption": "aws:kms"
#                }
#            }
#        },
#        {
#            "Sid": "DenyIncorrectHeaderThis is optional",
#            "Effect": "Deny",
#            "Principal": {
#                "Service": "guardduty.amazonaws.com"
#            },
#            "Action": "s3:PutObject",
#            "Resource": "arn:aws:s3:::myBucketName/[optional prefix]/*",
#            "Condition": {
#                "StringNotEquals": {
#                    "s3:x-amz-server-side-encryption-aws-kms-key-id": "arn:aws:kms:Region:111122223333:key/KMSKeyId"
#                }
#            }
#        }
#    ]
#}

data "aws_iam_policy_document" "aggregated_policy" {
  count                   = local.enable
  source_policy_documents = [join("", data.aws_iam_policy_document.s3_flow_logs.*.json)]
  #override_policy_documents = [var.bucket_custom_policy_json]
}

resource "aws_s3_bucket_policy" "default" {
  count      = local.enable
  depends_on = [aws_s3_bucket_public_access_block.self]
  bucket     = join("", aws_s3_bucket.self.*.id)
  policy     = join("", data.aws_iam_policy_document.aggregated_policy.*.json)
}
