module "securityhub_eu-west-1" {
  source     = "./modules/securityhub"
  count      = contains(var.target_regions, "eu-west-1") && var.enable_securityhub ? 1 : 0
  depends_on = [aws_organizations_organization.self]
  enable     = contains(var.target_regions, "eu-west-1") && var.enable_securityhub
  providers = {
    aws = aws.eu-west-1
  }
  account_type                      = var.account_type
  enable_products                   = var.securityhub_enable_products
  security_administrator_account_id = var.security_administrator_account_id
  tags                              = var.tags
}

module "securityhub_us-east-1" {
  source     = "./modules/securityhub"
  count      = contains(var.target_regions, "us-east-1") && var.enable_securityhub ? 1 : 0
  depends_on = [aws_organizations_organization.self]
  enable     = contains(var.target_regions, "us-east-1") && var.enable_securityhub
  providers = {
    aws = aws.us-east-1
  }
  account_type                      = var.account_type
  enable_products                   = var.securityhub_enable_products
  security_administrator_account_id = var.security_administrator_account_id
  tags                              = var.tags
}

module "securityhub_us-east-2" {
  source     = "./modules/securityhub"
  count      = contains(var.target_regions, "us-east-2") && var.enable_securityhub ? 1 : 0
  depends_on = [aws_organizations_organization.self]
  enable     = contains(var.target_regions, "us-east-2") && var.enable_securityhub
  providers = {
    aws = aws.us-east-2
  }
  account_type                      = var.account_type
  enable_products                   = var.securityhub_enable_products
  security_administrator_account_id = var.security_administrator_account_id
  tags                              = var.tags
}

/*
resource "aws_organizations_organization" "default" {
  count                         = var.enable_securityhub && var.account_type == "master" ? 1 : 0
  aws_service_access_principals = ["securityhub.amazonaws.com"]
  feature_set                   = "ALL"
}

resource "aws_securityhub_account" "default" {
  count      = var.enable_securityhub && var.account_type == "master" ? 1 : 0
}

resource "aws_securityhub_organization_admin_account" "default" {
  count      = var.enable_securityhub && var.account_type == "master" ? 1 : 0
  depends_on = [aws_organizations_organization.self]

  admin_account_id = var.security_administrator_account_id
}

# Auto enable security hub in organization member accounts
resource "aws_securityhub_organization_configuration" "default" {
  count       = var.enable_securityhub && var.account_type != "master" ? 1 : 0
  auto_enable = true
}

module "securityhub" {
  count   = var.account_type == "administrator" ? 1 : 0
  source  = "cloudposse/security-hub/aws"
  version = "0.9.0"

  enabled = var.enable_securityhub && var.account_type == "administrator"
  tags    = var.tags

  #create_sns_topic = true
  #subscribers = {
  #  opsgenie = {
  #    protocol               = "https"
  #    endpoint               = "https://api.example.com/v1/"
  #    endpoint_auto_confirms = true
  #    raw_message_delivery   = false
  #  }
  #}
}
*/
