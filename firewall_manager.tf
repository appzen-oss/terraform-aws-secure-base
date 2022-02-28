
# Only once for organization
module "firewall_manager_us-east-1" {
  source     = "./modules/firewall_manager"
  depends_on = [aws_organizations_organization.self]
  enable     = var.enable_firewall_manager
  providers = {
    aws = aws.us-east-1
  }
  account_type                      = var.account_type
  security_administrator_account_id = var.security_administrator_account_id
}
