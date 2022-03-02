
# Setup kms key

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
  s3_bucket_name                = data.terraform_remote_state.log.outputs.s3_bucket_region_name_map[data.aws_region.current.name]
  #s3_bucket_name                = lookup(local.s3_bucket_region_name_map, data.aws_region.current.name, module.s3_bucket-us-east-1[0].s3_bucket_name)
  s3_key_prefix = var.cloudtrail_s3_key_prefix
}
