
module "securityhub_eu-west-1" {
  source     = "./modules/securityhub"
  count      = contains(var.target_regions, "eu-west-1") && var.enable_securityhub ? 1 : 0
  depends_on = [aws_organizations_organization.self]
  enable     = contains(var.target_regions, "eu-west-1") && var.enable_securityhub
  providers = {
    aws = aws.eu-west-1
  }
  account_type                      = var.account_type
  security_administrator_account_id = var.security_administrator_account_id
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
  security_administrator_account_id = var.security_administrator_account_id
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
  security_administrator_account_id = var.security_administrator_account_id
}
