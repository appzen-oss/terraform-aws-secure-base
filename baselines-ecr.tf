
# --------------------------------------------------------------------------------------------------
# ECR Baseline - Regional
# --------------------------------------------------------------------------------------------------

module "baseline_ecr_eu-west-1" {
  source = "./modules/baseline_ecr"
  providers = {
    aws = aws.eu-west-1
  }
  enable    = contains(var.target_regions, "eu-west-1") && var.enable_ecr_baseline
  rules     = var.ecr_scanning_rules
  scan_type = var.ecr_scan_type
}

module "baseline_ecr_us-east-1" {
  source = "./modules/baseline_ecr"
  providers = {
    aws = aws.us-east-1
  }
  enable    = contains(var.target_regions, "us-east-1") && var.enable_ecr_baseline
  rules     = var.ecr_scanning_rules
  scan_type = var.ecr_scan_type
}

module "baseline_ecr_us-east-2" {
  source = "./modules/baseline_ecr"
  providers = {
    aws = aws.us-east-2
  }
  enable    = contains(var.target_regions, "us-east-2") && var.enable_ecr_baseline
  rules     = var.ecr_scanning_rules
  scan_type = var.ecr_scan_type
}
