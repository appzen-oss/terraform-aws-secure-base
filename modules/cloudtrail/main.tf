
#https://docs.aws.amazon.com/organizations/latest/userguide/services-that-can-integrate-cloudtrail.html
#aws organizations enable-aws-service-access \
#    --service-principal cloudtrail.amazonaws.com

# Configure cloudtrail per account
# Upload SCP policy to org to prevent changes
#
#https://docs.aws.amazon.com/awscloudtrail/latest/userguide/receive-cloudtrail-log-files-from-multiple-regions.html
#https://docs.aws.amazon.com/awscloudtrail/latest/userguide/creating-trail-organization.html
#https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-create-and-update-an-organizational-trail-by-using-the-aws-cli.html
# org cloudtrail in org master and primary region

#aws cloudtrail create-trail --name my-trail --s3-bucket-name my-bucket --is-organization-trail --is-multi-region-trail
#aws cloudtrail update-trail --name my-trail --is-organization-trail

# tf-wrappers/environments/cloudtrail
#   using modified cloudposse (0.21.0) fork
#     insight_selector
# Supports organization & multi-region, kms, sns
# filter Exclude AWS KMS events or Exclude Amazon RDS Data API events
#   event_selector (supported) or advanced_event_selector

# TODO: put these test ignores in the module

#tfsec:ignore:aws-cloudtrail-enable-at-rest-encryption
module "cloudtrail" {
  #ts:skip=AC_AWS_0448 Multi Region is enabled. Not work with Org?
  #source  = "../../../terraform-aws-cloudtrail"
  source  = "appzen-oss/cloudtrail/aws"
  version = "0.22.0"

  name                              = var.name
  enable_log_file_validation        = var.enable_log_file_validation
  cloud_watch_logs                  = var.cloud_watch_logs
  include_global_service_events     = var.include_global_service_events
  is_multi_region_trail             = var.is_multi_region_trail
  is_organization_trail             = var.is_organization_trail
  insight_selector                  = var.insight_selector
  enable_logging                    = var.enable_logging
  kms_key_arn                       = var.kms_key_arn
  s3_bucket_name                    = var.s3_bucket_name
  s3_key_prefix                     = var.s3_key_prefix
  tags                              = var.tags
}

# Pass tags
