module "config-us-east-1" {
  #for_each    = var.enable_config == true ? toset(["us-east-1"]) : toset([])
  count       = var.enable_config && contains(var.target_regions, "us-east-1") ? 1 : 0
  source      = "./modules/config"
  depends_on  = [aws_organizations_organization.self]
  enable      = var.enable_config && contains(var.target_regions, "us-east-1")
/*
  providers = {
    #aws = aws.us-east-1
    aws = aws.home
  }
*/
  account_type                      = var.account_type
  s3_bucket_name                    = "appzen-log-infra-us-east-1"
  security_administrator_account_id = var.security_administrator_account_id
}

/*
  #count       = var.enable_config && contains(var.target_regions, each.value) ? 1 : 0
module "config" {
  for_each = var.enable_config == true ? toset(["us-east-1"]) : toset([])
  #for_each = var.enable_config == true ? toset(data.aws_regions.enabled.names) : toset([])
  source = "cloudposse/config/aws"
  version     = "0.16.0"

  create_sns_topic = var.config_create_sns_topic
  create_iam_role  = var.config_create_iam_role

  global_resource_collector_region  = var.config_region
  s3_bucket_id                      = var.config_s3_bucket_id
  s3_bucket_arn                     = "arn:aws:s3:::${var.config_s3_bucket_id}"

  managed_rules = {
    account-part-of-organizations = {
      description       = "Checks whether AWS account is part of AWS Organizations. The rule is NON_COMPLIANT if an AWS account is not part of AWS Organizations or AWS Organizations master account ID does not match rule parameter MasterAccountId.",
      identifier        = "config-${each.value}"
      input_parameters  = {}
      tags              = {}
      trigger_type      = "PERIODIC"
      enabled           = var.enable_config
    }
  }
}
*/
