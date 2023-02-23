
# Regional
module "inspector_us-east-1" {
  source     = "./modules/inspector"
  depends_on = [aws_organizations_organization.self]
  enable     = var.enable_inspector
  providers = {
    aws = aws.us-east-1
  }
  account_type                      = var.account_type
  security_administrator_account_id = var.security_administrator_account_id
}
module "inspector_eu-west-1" {
  source     = "./modules/inspector"
  depends_on = [aws_organizations_organization.self]
  enable     = var.enable_inspector
  providers = {
    aws = aws.eu-west-1
  }
  account_type                      = var.account_type
  security_administrator_account_id = var.security_administrator_account_id
}
