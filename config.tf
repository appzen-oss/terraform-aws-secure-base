module "config-us-east-1" {
  count       = var.enable_config && contains(var.target_regions, "us-east-1") ? 1 : 0
  source      = "./modules/config"
  depends_on  = [aws_organizations_organization.self]
  enable      = var.enable_config && contains(var.target_regions, "us-east-1")
  account_type                      = var.account_type
  primary_region                    = "us-east-1"
  s3_bucket_name                    = "appzen-log-infra-us-east-1"
  security_administrator_account_id = var.security_administrator_account_id
}

module "config-us-east-2" {
  count       = var.enable_config && contains(var.target_regions, "us-east-2") ? 1 : 0
  source      = "./modules/config"
  depends_on  = [aws_organizations_organization.self]
  enable      = var.enable_config && contains(var.target_regions, "us-east-2")
  account_type                      = var.account_type
  primary_region                    = "us-east-2"
  s3_bucket_name                    = "appzen-log-infra-us-east-2"
  security_administrator_account_id = var.security_administrator_account_id
}

module "config-eu-west-1" {
  count       = var.enable_config && contains(var.target_regions, "eu-west-1") ? 1 : 0
  source      = "./modules/config"
  depends_on  = [aws_organizations_organization.self]
  enable      = var.enable_config && contains(var.target_regions, "eu-west-1")
  account_type                      = var.account_type
  primary_region                    = "eu-west-1"
  s3_bucket_name                    = "appzen-log-infra-eu-west-1"
  security_administrator_account_id = var.security_administrator_account_id
}

