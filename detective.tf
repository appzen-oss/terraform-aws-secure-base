
#locals {
#  enable_detective = var.enable_detective && var.enable_guardduty ? 1 : 0
#}

#module "detective-eu-west-1" {
#  source                            = "./modules/detective"
#  enable                           = local.enable_detective && contains(var.target_regions, "eu-west-1")
#  account_type                      = var.account_type
#  security_administrator_account_id = var.security_administrator_account_id
#  tags = var.tags
#  depends_on                        = [module.guardduty-eu-west-1]
#  providers = {
#    aws = aws.eu-west-1
#  }
#}
#
#module "detective-us-east-1" {
#  source                            = "./modules/detective"
#  enable                           = var.local.enable_detective && contains(var.target_regions, "us-east-1")
#  account_type                      = var.account_type
#  security_administrator_account_id = var.security_administrator_account_id
#  tags = var.tags
#  depends_on                        = [module.guardduty-us-east-1]
#  providers = {
#    aws = aws.us-east-1
#  }
#}
#module "detective-us-east-2" {
#  source                            = "./modules/detective"
#  enable                           = var.local.enable_detective && contains(var.target_regions, "us-east-2")
#  account_type                      = var.account_type
#  security_administrator_account_id = var.security_administrator_account_id
#  tags = var.tags
#  depends_on                        = [module.guardduty-us-east-2]
#  providers = {
#    aws = aws.us-east-2
#  }
#}
