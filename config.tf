# did not use cloudposse due to the below is only true for one region
## aws configservice describe-configuration-recorders --query ConfigurationRecorders[].recordingGroup.includeGlobalResourceTypes 
module "config" {
  source = "./modules/config"
  #source = "cloudposse/config/aws"
  #version     = "0.16.0"

  create_sns_topic = true
  create_iam_role  = true

  managed_rules = {
    account-part-of-organizations = {
      description  = "Checks whether AWS account is part of AWS Organizations. The rule is NON_COMPLIANT if an AWS account is not part of AWS Organizations or AWS Organizations master account ID does not match rule parameter MasterAccountId.",
      identifier   = "ACCOUNT_PART_OF_ORGANIZATIONS",
      trigger_type = "PERIODIC"
      enabled      = true
      input_parameters  = ""
      tags              = var.tags
    }
  }
  #enable_config_recorder            = var.enable_config_recorder
  s3_bucket_id                      = var.log_s3_bucket
  s3_bucket_arn                     = "arn:aws:s3:::${var.log_s3_bucket}"
  s3_key_prefix                     = var.config_s3_key_prefix
  global_resource_collector_region  = "us-east-1"
}
