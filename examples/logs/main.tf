
module "secure_base" {
  source                            = "../../"
  account_type                      = var.account_type
  aws_profile                       = var.aws_profile
  security_administrator_account_id = var.security_administrator_account_id
  target_regions                    = var.target_regions

  # Infrastructure
  enable_s3_buckets = var.enable_s3_buckets

  # AWS Account/Region security settings
  enable_ebs_baseline = var.enable_ebs_baseline
  enable_ecr_baseline = var.enable_ecr_baseline
  enable_iam_baseline = var.enable_iam_baseline
  enable_s3_baseline  = var.enable_s3_baseline

  # AWS Security Services
  enable_cloudtrail          = var.enable_cloudtrail
  enable_config              = var.enable_config
  enable_firewall_manager    = var.enable_firewall_manager
  enable_guardduty           = var.enable_guardduty
  enable_iam_access_analyzer = var.enable_iam_access_analyzer
  enable_securityhub         = var.enable_securityhub
}
