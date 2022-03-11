
# Manage organization SCP policies

module "scp" {
  source            = "./modules/scp"
  count             = var.enable_scp && var.account_type == "master" ? 1 : 0
  account_type      = var.account_type
  enable            = var.enable_scp
  enable_cloudtrail = var.enable_cloudtrail
  enable_config     = var.enable_config
  enable_ebs        = var.enable_ebs_baseline
  enable_ecr        = var.enable_ecr_baseline
  enable_guardduty  = var.enable_guardduty
  enable_iam        = var.enable_iam_baseline
  enable_s3         = var.enable_s3_baseline
  tags              = var.tags
}
