module "config" {
  for_each = var.enable_config == true ? toset([]) : toset(data.aws_regions.enabled.names)
  source = "cloudposse/config/aws"
  version     = "0.16.0"

  create_sns_topic = true
  create_iam_role  = true

  global_resource_collector_region  = var.config_region
  s3_bucket_id                      = var.config_s3_bucket_id
  s3_bucket_arn                     = "arn:aws:s3:::${var.config_s3_bucket_id}"

  managed_rules = {
    account-part-of-organizations = {
      description       = "Checks whether AWS account is part of AWS Organizations. The rule is NON_COMPLIANT if an AWS account is not part of AWS Organizations or AWS Organizations master account ID does not match rule parameter MasterAccountId.",
      identifier        = "ACCOUNT_PART_OF_ORGANIZATIONS"
      input_parameters  = {}
      tags              = {}
      trigger_type      = "PERIODIC"
      enabled           = var.enable_config
    }
  }
}
