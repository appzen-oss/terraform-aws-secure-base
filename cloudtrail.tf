module "cloudtrail" {
  source = "./modules/cloudtrail"
  count  = var.enable_cloudtrail && var.account_type == "master" ? 1 : 0
  depends_on = [
    module.s3_bucket-eu-west-1,
    module.s3_bucket-us-east-1,
    module.s3_bucket-us-east-2,
    module.kms-cloudtrail-us-east-1,
    aws_kms_grant.org_kms
  ]

  name                              = var.cloudtrail_name
  enable_log_file_validation        = var.cloudtrail_enable_log_file_validation
  enable_logging                    = var.cloudtrail_enable_logging
  include_global_service_events     = var.cloudtrail_include_global_service_events
  insight_selector                  = var.cloudtrail_insight_selector
  is_multi_region_trail             = var.cloudtrail_is_multi_region_trail
  is_organization_trail             = var.cloudtrail_is_organization_trail
  kms_key_arn                       = var.kms_key_id == "" ? "" : data.aws_kms_key.by_alias[0].arn
  s3_bucket_name                    = var.log_s3_bucket
  s3_key_prefix                     = var.cloudtrail_s3_key_prefix
  tags                              = var.tags
}
