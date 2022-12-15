locals {
  non_master_account_arn  = data.aws_organizations_organization.current.non_master_accounts == null ? [] : [ for id in data.aws_organizations_organization.current.non_master_accounts[*].id : "arn:aws:iam::${id}:root" ]
}

# Setup kms key
module "kms_key" {
  count  = var.enable_cloudtrail && var.account_type == "master" ? 1 : 0
  source = "cloudposse/kms-key/aws"
  version = "0.12.1"
  alias                   = "alias/${var.cloudtrail_name}_cloudtrail"
  name                    = "cloudtrail"
  description             = "KMS key for cloudtrail"
  deletion_window_in_days = 10
  enable_key_rotation     = true
  multi_region            = true
  policy                  = jsonencode(
    {
      "Statement" : [
        {
          "Sid": "Enable IAM User Permissions",
          "Effect": "Allow",
          "Principal": {
              "AWS": "arn:aws:iam::${data.aws_caller_identity.current.id}:root"
          },
          "Action": "kms:*",
          "Resource": "*"
        },
        {
          "Sid": "Allow an external account to use this KMS key",
          "Effect": "Allow",
          "Principal": {
              "AWS": local.non_master_account_arn
          },
          "Action": [
              "kms:Encrypt",
              "kms:Decrypt",
              "kms:ReEncrypt*",
              "kms:GenerateDataKey*",
              "kms:DescribeKey"
          ],
          "Resource": "*"
        }
      ]
    }
  )
  tags                    = var.tags
}

module "cloudtrail" {
  source = "./modules/cloudtrail"
  count  = var.enable_cloudtrail && var.account_type == "master" ? 1 : 0
  depends_on = [
    module.s3_bucket-eu-west-1,
    module.s3_bucket-us-east-1,
    module.s3_bucket-us-east-2
  ]

  name                          = var.cloudtrail_name
  enable_log_file_validation    = var.cloudtrail_enable_log_file_validation
  enable_logging                = var.cloudtrail_enable_logging
  include_global_service_events = var.cloudtrail_include_global_service_events
  insight_selector              = var.cloudtrail_insight_selector
  is_multi_region_trail         = var.cloudtrail_is_multi_region_trail
  is_organization_trail         = var.cloudtrail_is_organization_trail
  kms_key_arn                   = var.cloudtrail_kms_key_arn
  s3_bucket_name                = var.cloudtrail_s3_bucket
  s3_key_prefix                 = var.cloudtrail_s3_key_prefix
  tags                          = var.tags
}
