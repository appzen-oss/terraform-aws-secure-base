

module "guardduty-us-east-1" {
  source     = "./modules/guardduty"
  count      = var.enable_guardduty && contains(var.target_regions, "us-east-1") ? 1 : 0
  depends_on = [aws_organizations_organization.self]
  enable     = var.enable_guardduty && contains(var.target_regions, "us-east-1")
  providers = {
    aws = aws.us-east-1
  }
  account_type                      = var.account_type
  security_administrator_account_id = var.security_administrator_account_id
}

module "guardduty-us-east-2" {
  source     = "./modules/guardduty"
  count      = var.enable_guardduty && contains(var.target_regions, "us-east-2") ? 1 : 0
  depends_on = [aws_organizations_organization.self]
  enable     = var.enable_guardduty && contains(var.target_regions, "us-east-2")
  providers = {
    aws = aws.us-east-2
  }
  account_type                      = var.account_type
  security_administrator_account_id = var.security_administrator_account_id
}

module "guardduty-eu-west-1" {
  source     = "./modules/guardduty"
  count      = var.enable_guardduty && contains(var.target_regions, "eu-west-1") ? 1 : 0
  depends_on = [aws_organizations_organization.self]
  enable     = var.enable_guardduty && contains(var.target_regions, "eu-west-1")
  providers = {
    aws = aws.eu-west-1
  }
  account_type                      = var.account_type
  security_administrator_account_id = var.security_administrator_account_id
}
