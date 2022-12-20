module "config" {
  source = "cloudposse/config/aws"
  version     = "0.16.0"

  create_sns_topic = true
  create_iam_role  = true

  managed_rules = {
    account-part-of-organizations = {
      description  = "Checks whether AWS account is part of AWS Organizations. The rule is NON_COMPLIANT if an AWS account is not part of AWS Organizations or AWS Organizations master account ID does not match rule parameter MasterAccountId.",
      identifier   = "ACCOUNT_PART_OF_ORGANIZATIONS",
      trigger_type = "PERIODIC"
      enabled      = true
      input_parameters  = []
      tags              = var.tags
    }
  }
  s3_bucket_id                      = var.log_s3_bucket
  s3_bucket_arn                     = "arn:aws:s3:::${var.log_s3_bucket}"
  s3_key_prefix                     = var.config_s3_key_prefix
  global_resource_collector_region  = "us-east-1"
}
/*
module "config-us-east-1" {
  count       = var.enable_config && contains(var.target_regions, "us-east-1") ? 1 : 0
  source      = "./modules/config"
  depends_on  = [aws_organizations_organization.self]
  enable      = var.enable_config && contains(var.target_regions, "us-east-1")
  account_type                      = var.account_type
  current_region                    = "us-east-1"
  s3_bucket_name                    = "appzen-log-infra-us-east-1"
  security_administrator_account_id = var.security_administrator_account_id
}

module "config-us-east-2" {
  count       = var.enable_config && contains(var.target_regions, "us-east-2") ? 1 : 0
  source      = "./modules/config"
  depends_on  = [aws_organizations_organization.self]
  enable      = var.enable_config && contains(var.target_regions, "us-east-2")
  account_type                      = var.account_type
  current_region                    = "us-east-2"
  s3_bucket_name                    = "appzen-log-infra-us-east-2"
  security_administrator_account_id = var.security_administrator_account_id
}

module "config-eu-west-1" {
  count       = var.enable_config && contains(var.target_regions, "eu-west-1") ? 1 : 0
  source      = "./modules/config"
  depends_on  = [aws_organizations_organization.self]
  enable      = var.enable_config && contains(var.target_regions, "eu-west-1")
  account_type                      = var.account_type
  current_region                    = "eu-west-1"
  s3_bucket_name                    = "appzen-log-infra-eu-west-1"
  security_administrator_account_id = var.security_administrator_account_id
}
*/
