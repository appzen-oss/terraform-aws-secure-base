
#https://docs.aws.amazon.com/organizations/latest/userguide/services-that-can-integrate-cloudtrail.html
#aws organizations enable-aws-service-access \
#    --service-principal cloudtrail.amazonaws.com

# Configure cloudtrail per account
# Upload SCP policy to org to prevent changes
#
# tf-wrappers/environments/cloudtrail
#   using modified cloudposse fork
#module "cloudtrail" {
#  source  = "appzen-oss/cloudtrail/aws"
#  version = "0.20.0"
#
#  name                          = "${trimprefix(var.aws_profile, "appzen-")}-account-trail"
#  enable_log_file_validation    = var.enable_log_file_validation
#  include_global_service_events = var.include_global_service_events
#  is_multi_region_trail         = var.is_multi_region_trail
#  insight_selector              = var.insight_selector
#  enable_logging                = var.enable_logging
#  s3_bucket_name                = var.s3_bucket_name
#  s3_key_prefix                 = var.s3_key_prefix
#}
