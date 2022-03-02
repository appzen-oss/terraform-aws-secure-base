
locals {
  enable        = var.enable ? 1 : 0
  s3_bucket_arn = one(aws_s3_bucket.self.*.arn)
}

module "label" {
  source      = "cloudposse/label/null"
  version     = "0.25.0"
  namespace   = data.aws_iam_account_alias.current.account_alias
  name        = "infra"
  attributes  = [data.aws_region.current.name]
  label_order = ["namespace", "name", "attributes"]
  tags = {
    "Environment" = "infra"
    "Product"     = "security"
    "Team"        = "devops"
    "Terraform"   = true
  }
}

#tfsec:ignore:aws-s3-block-public-acls
#tfsec:ignore:aws-s3-block-public-policy
#tfsec:ignore:aws-s3-enable-bucket-encryption
#tfsec:ignore:aws-s3-enable-bucket-logging
#tfsec:ignore:aws-s3-enable-versioning
#tfsec:ignore:aws-s3-encryption-customer-key
#tfsec:ignore:aws-s3-ignore-public-acls
#tfsec:ignore:aws-s3-no-public-buckets
#tfsec:ignore:aws-s3-specify-public-access-block
resource "aws_s3_bucket" "self" {
  #checkov:skip=CKV_AWS_18:Consider logging in future
  #checkov:skip=CKV_AWS_19:Require encryption. Not working?
  #checkov:skip=CKV_AWS_21:Versioning not needed yet
  #checkov:skip=CKV_AWS_144:Cross region replication not needed
  #checkov:skip=CKV_AWS_145:KMS not required
  #ts:skip=AC_AWS_0207 KMS not required
  #ts:skip=AC_AWS_0214 Versioning not needed yet
  #ts:skip=AC_AWS_0497 Consider logging in future
  count         = local.enable
  bucket        = module.label.id
  force_destroy = var.force_destroy
  tags          = module.label.tags

  #object_lock_configuration {
  #  object_lock_enabled = "Enabled"
  #}
}

#resource "aws_s3_bucket_acl" "self" {
#  count      = var.enable ? 1 : 0
#  depends_on = [aws_s3_bucket.self]
#  bucket     = aws_s3_bucket.self[0].id
#  acl        = "private"
#  #expected_bucket_owner =
#}
#dynamic "grant" {
#  for_each = try(length(var.grants), 0) == 0 || try(length(var.acl), 0) > 0 ? [] : var.grants
#  content {
#    id          = grant.value.id
#    type        = grant.value.type
#    permissions = grant.value.permissions
#    uri         = grant.value.uri
#  }
#}

resource "aws_s3_bucket_versioning" "self" {
  count      = var.enable && var.enable_versioning ? 1 : 0
  depends_on = [aws_s3_bucket.self]
  bucket     = aws_s3_bucket.self[0].id
  #expected_bucket_owner =
  versioning_configuration {
    status = "Enabled"
  }
}

#resource "aws_s3_bucket_logging" "self" {
#  count      = var.enable && var.logging != null ? 1 : 0
#  depends_on = [aws_s3_bucket.self]
#  bucket     = aws_s3_bucket.self[0].id
#  #expected_bucket_owner =
#  target_bucket = var.logging["bucket_name"]
#  target_prefix = var.logging["prefix"]
#}

# https://docs.aws.amazon.com/AmazonS3/latest/dev/bucket-encryption.html
resource "aws_s3_bucket_server_side_encryption_configuration" "self" {
  #checkov:skip=CKV_AWS_19:Require encryption. Not working?
  #checkov:skip=CKV_AWS_145:KMS not required
  #ts:skip=AC_AWS_0207 KMS not required
  count      = var.enable ? 1 : 0
  depends_on = [aws_s3_bucket.self]
  bucket     = aws_s3_bucket.self[0].bucket
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = var.kms_master_key_arn == "" ? "AES256" : "aws:kms"
      kms_master_key_id = var.kms_master_key_arn
    }
  }
}

#resource "aws_s3_bucket_object_lock_configuration" "self" {
#  bucket = aws_s3_bucket.example.bucket
#  rule {
#    default_retention {
#      mode = "COMPLIANCE"
#      days = 5
#    }
#  }
#}
#dynamic "object_lock_configuration" {
#  for_each = var.object_lock_configuration != null ? [1] : []
#  content {
#    object_lock_enabled = "Enabled"
#    rule {
#      default_retention {
#        mode  = var.object_lock_configuration.mode
#        days  = var.object_lock_configuration.days
#        years = var.object_lock_configuration.years
#      }
#    }
#  }
#}

#resource "aws_s3_bucket_lifecycle_configuration" "versioning" {
#  count = var.enable && var.enable_versioning ? 1 : 0
#  depends_on = [aws_s3_bucket_versioning.self]
#  bucket = aws_s3_bucket.self[0].bucket
#  #expected_bucket_owner =
#  rule {}
#}
#resource "aws_s3_bucket_lifecycle_configuration" "self" {
#  count = var.enable && !var.enable_versioning ? 1 : 0
#  depends_on = [aws_s3_bucket.self]
#  bucket = aws_s3_bucket.self[0].bucket
#  #expected_bucket_owner =
#  rule {}
#}
# ADD lifecycles after everything else is working
#  dynamic "lifecycle_rule" {
#    for_each = var.lifecycle_rules
#    content {
#      # id =
#      enabled                                = lifecycle_rule.value.enabled
#      prefix                                 = lifecycle_rule.value.prefix
#      tags                                   = lifecycle_rule.value.tags
#      abort_incomplete_multipart_upload_days = lifecycle_rule.value.abort_incomplete_multipart_upload_days
#
#      dynamic "noncurrent_version_expiration" {
#        for_each = lifecycle_rule.value.enable_noncurrent_version_expiration ? [1] : []
#        content {
#          days = lifecycle_rule.value.noncurrent_version_expiration_days
#        }
#      }
#
#      dynamic "noncurrent_version_transition" {
#        for_each = lifecycle_rule.value.enable_glacier_transition ? [1] : []
#        content {
#          days          = lifecycle_rule.value.noncurrent_version_glacier_transition_days
#          storage_class = "GLACIER"
#        }
#      }
#
#      dynamic "noncurrent_version_transition" {
#        for_each = lifecycle_rule.value.enable_deeparchive_transition ? [1] : []
#        content {
#          days          = lifecycle_rule.value.noncurrent_version_deeparchive_transition_days
#          storage_class = "DEEP_ARCHIVE"
#        }
#      }
#
#      dynamic "transition" {
#        for_each = lifecycle_rule.value.enable_glacier_transition ? [1] : []
#        content {
#          days          = lifecycle_rule.value.glacier_transition_days
#          storage_class = "GLACIER"
#        }
#      }
#
#      dynamic "transition" {
#        for_each = lifecycle_rule.value.enable_deeparchive_transition ? [1] : []
#        content {
#          days          = lifecycle_rule.value.deeparchive_transition_days
#          storage_class = "DEEP_ARCHIVE"
#        }
#      }
#
#      dynamic "transition" {
#        for_each = lifecycle_rule.value.enable_standard_ia_transition ? [1] : []
#        content {
#          days          = lifecycle_rule.value.standard_transition_days
#          storage_class = "STANDARD_IA"
#        }
#      }
#
#      dynamic "expiration" {
#        for_each = lifecycle_rule.value.enable_current_object_expiration ? [1] : []
#        content {
#          days = lifecycle_rule.value.expiration_days
#        }
#      }
#    }
#  }

# Refer to the terraform documentation on s3_bucket_public_access_block at
# https://www.terraform.io/docs/providers/aws/r/s3_bucket_public_access_block.html
resource "aws_s3_bucket_public_access_block" "self" {
  count      = local.enable
  depends_on = [aws_s3_bucket.self]
  bucket     = join("", aws_s3_bucket.self.*.id)

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Per https://docs.aws.amazon.com/AmazonS3/latest/userguide/about-object-ownership.html
resource "aws_s3_bucket_ownership_controls" "self" {
  count  = local.enable
  bucket = join("", aws_s3_bucket.self.*.id)

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
  depends_on = [time_sleep.wait_for_aws_s3_bucket_settings]
}

# Workaround S3 eventual consistency for settings objects
resource "time_sleep" "wait_for_aws_s3_bucket_settings" {
  count            = local.enable
  depends_on       = [aws_s3_bucket_public_access_block.self, aws_s3_bucket_policy.default]
  create_duration  = "30s"
  destroy_duration = "30s"
}
