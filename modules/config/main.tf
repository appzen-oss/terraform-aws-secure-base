
# https://docs.aws.amazon.com/config/latest/developerguide/WhatIsConfig.html

#https://www.linkedin.com/pulse/aws-config-multi-account-multi-region-data-jon-bonso/
#https://www.contino.io/insights/aws-config-aggregator-compliance
#https://tutorialsdojo.com/multi-account-multi-region-data-aggregation-on-aws-config/
#https://aws.amazon.com/blogs/mt/aws-config-rdk-multi-account-and-multi-region-deployment/
#https://aws.amazon.com/blogs/mt/aws-organizations-aws-config-and-terraform/

# Deliver data to
#   S3
#   SNS

# Regional service
#   Setup in each account and region
# Aggregator in administrator account to collect data from all acocunts and regions

# There can only be one Recorder and one Delivery Channel in each account

# https://docs.aws.amazon.com/organizations/latest/userguide/services-that-can-integrate-config.html
# aws organizations enable-aws-service-access \
#    --service-principal config.amazonaws.com
### Enable
# aws configservice put-configuration-recorder --configuration-recorder name=default,roleARN=arn:aws:iam::123456789012:role/config-role --recording-group allSupported=true,includeGlobalResourceTypes=true
# aws configservice put-delivery-channel --delivery-channel file://deliveryChannel.json
#{
#    "name": "default",
#    "s3BucketName": "config-bucket-123456789012",
#    "snsTopicARN": "arn:aws:sns:us-east-2:123456789012:config-topic",
#    "configSnapshotDeliveryProperties": {
#        "deliveryFrequency": "Twelve_Hours"
#    }
#}
# aws configservice start-configuration-recorder --configuration-recorder-name configRecorderName

# Config rules
#https://aws.amazon.com/blogs/devops/how-to-centrally-manage-aws-config-rules-across-multiple-aws-accounts/
# Regional
#resource "aws_config_organization_managed_rule"
#  depends_on = [aws_config_configuration_recorder.config_recorder]

# Conformance packs
#https://docs.aws.amazon.com/config/latest/developerguide/conformance-packs.html
#https://docs.aws.amazon.com/config/latest/developerguide/conformancepack-sample-templates.html
#https://aws.amazon.com/blogs/mt/best-practices-for-aws-config-conformance-packs/
#https://docs.aws.amazon.com/config/latest/developerguide/conformance-pack-organization-apis.html
#https://github.com/awslabs/aws-config-rules/tree/master/aws-config-conformance-packs
#   S3 bucket policies to allow conforms to access
#     arn:aws:iam::*:role/aws-service-role/config-conforms.amazonaws.com/AWSServiceRoleForConfigConforms

# Multi-Acccount Multi-Region Aggregation
# https://docs.aws.amazon.com/config/latest/developerguide/aggregate-data.html
# source account, source region -> org aggregator -> aggregator account (administrator)
# all_regions = true

# aws configservice put-configuration-aggregator --configuration-aggregator-name MyAggregator --organization-aggregation-source "{\"RoleArn\": \"Complete-Arn\",\"AllAwsRegions\": true}"
# aws organizations enable-aws-service-access --service-principal config.amazonaws.com
# aws organizations register-delegated-administrator --service-principal config.amazonaws.com --account-id MemberAccountID
# NOT for org: aws configservice put-aggregation-authorization --authorized-account-id  AccountID --authorized-aws-region Region

locals {
  primary_region        = var.primary_region == "" ? "us-east-1" : var.primary_region
  is_aggregation_region = local.primary_region == data.aws_region.current.name
  is_administrator      = var.account_type == "administrator"
  is_master             = var.account_type == "master"
}

### ====================================================
### Delegation
### Regional - Organization Master
### ====================================================
resource "aws_organizations_delegated_administrator" "config" {
  #count             = var.enable ? 1 : 0
  count             = var.enable && local.is_master && var.primary_region == var.current_region ? 1 : 0
  #count             = var.enable && local.is_master && local.is_aggregation_region ? 1 : 0
  account_id        = var.security_administrator_account_id
  service_principal = "config.amazonaws.com"
}

### ====================================================
### Aggregator
### Primary region only - Administrator
### ====================================================
resource "aws_iam_role" "default" {
  count              = var.enable && var.primary_region == var.current_region ? 1 : 0
  name               = var.org_aggregator_role_name
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "config.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "organization" {
  count      = var.enable && local.is_administrator && var.primary_region == var.current_region ? 1 : 0
  depends_on = [aws_iam_role.default]
  role       = aws_iam_role.default[0].name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSConfigRoleForOrganizations"
}

resource "aws_config_configuration_aggregator" "organization" {
  count      = var.enable && local.is_master && var.primary_region == var.current_region ? 1 : 0
  depends_on = [aws_iam_role_policy_attachment.organization]
  name       = var.org_aggregator_name
  organization_aggregation_source {
    all_regions = true
    role_arn    = aws_iam_role.default[0].arn
  }
  tags = var.tags
}

/*
resource "aws_config_configuration_aggregator" "member" {
  count      = var.enable && not local.is_master ? 1 : 0
  depends_on = [aws_iam_role_policy_attachment.organization]
  name       = var.org_aggregator_name
  account_aggregation_source {
    account_ids = data.aws_organizations_organization.current.accounts[*].id
    all_regions = true
  }
  tags = var.tags
}
*/

### ====================================================
### AWS Config recorder and let it publish results and send notifications.
### Regional
### ====================================================
# IAM role s3 & sns policies

### SNS
# Flesh out. Look at cloudposse/sns-topic/aws"
#tfsec:ignore:aws-sns-enable-topic-encryption
#resource "aws_sns_topic" "config" {
#  #checkov:skip=CKV_AWS_26:Allow unencrypted SNS for now
#  count             = var.enable ? 1 : 0
#  name              = var.sns_topic_name
#  kms_master_key_id = var.sns_topic_kms_master_key_id
#  tags              = var.tags
#}
#
#data "aws_iam_policy_document" "config-sns-policy" {
#  count = var.enable ? 1 : 0
#  statement {
#    actions   = ["sns:Publish"]
#    resources = [aws_sns_topic.config[0].arn]
#    principals {
#      type        = "Service"
#      identifiers = ["config.amazonaws.com"]
#    }
#    condition {
#      test     = "ArnLike"
#      variable = "aws:SourceArn"
#      values   = ["arn:aws:config:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:*"]
#    }
#  }
#}
#
#resource "aws_sns_topic_policy" "config" {
#  count  = var.enable ? 1 : 0
#  arn    = aws_sns_topic.config[0].arn
#  policy = data.aws_iam_policy_document.config-sns-policy[0].json
#}

### Config Recorder
# Each account & region
# Recorder IAM role

# Each account & region
resource "aws_config_configuration_recorder" "recorder" {
  count    = var.enable ? 1 : 0
  name     = var.recorder_name == "" ? "default" : var.recorder_name
  role_arn = var.iam_role_arn == "" ? "arn:aws:iam::${data.aws_caller_identity.current.id}:role/${var.org_aggregator_role_name}" : var.iam_role_arn
  recording_group {
    all_supported                 = true
    include_global_resource_types = var.include_global_resource_types
  }
}
# or
#   all_supported   = false
#   resource_types  =

# Each account & region
resource "aws_config_delivery_channel" "bucket" {
  count          = var.enable ? 1 : 0
  name           = var.delivery_channel_name == "" ? "default" : var.delivery_channel_name
  s3_bucket_name = var.s3_bucket_name
  s3_key_prefix  = var.s3_key_prefix
  #s3_kms_key_arn =
  #sns_topic_arn = aws_sns_topic.config[0].arn
  snapshot_delivery_properties {
    delivery_frequency = var.delivery_frequency
  }
  depends_on = [aws_config_configuration_recorder.recorder[0]]
  # aws_sns_topic.config
}

# Each account & region
resource "aws_config_configuration_recorder_status" "recorder" {
  count      = var.enable ? 1 : 0
  name       = aws_config_configuration_recorder.recorder[0].id
  is_enabled = true
  depends_on = [aws_config_delivery_channel.bucket[0]]
}

### Conformance packs and rules
# Administrator
#resource "aws_config_organization_conformance_pack" ""
#  count = var.enable && var.account_type == "administrator" ? 1 : 0
#resource "aws_config_organization_custom_rule" ""
#  count = var.enable && var.account_type == "administrator" ? 1 : 0
#resource "aws_config_organization_managed_rule" ""
#  count = var.enable && var.account_type == "administrator" ? 1 : 0

#resource "aws_config_config_rule" "rules" {
#  for_each   = module.this.enabled ? var.managed_rules : {}
#  depends_on = [aws_config_configuration_recorder_status.recorder_status]
#  name        = each.key
#  description = each.value.description
#  source {
#    owner             = "AWS"
#    source_identifier = each.value.identifier
#  }
#  input_parameters = length(each.value.input_parameters) > 0 ? jsonencode(each.value.input_parameters) : null
#  tags             = merge(module.this.tags, each.value.tags)
#}
