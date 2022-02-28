# --------------------------------------------------------------------------------------------------
# EBS Baseline - Regional
# --------------------------------------------------------------------------------------------------
#module "baseline_ebs_ap-northeast-1" {
#  source = "./modules/baseline_ebs"
#  providers = {
#    aws = aws.ap-northeast-1
#  }
#  enable = contains(var.target_regions, "ap-northeast-1") && var.enable_ebs_baseline
#}
#
#module "baseline_ebs_ap-northeast-2" {
#  source = "./modules/baseline_ebs"
#  providers = {
#    aws = aws.ap-northeast-2
#  }
#  enable = contains(var.target_regions, "ap-northeast-2") && var.enable_ebs_baseline
#}
#
#module "baseline_ebs_ap-northeast-3" {
#  source = "./modules/baseline_ebs"
#  providers = {
#    aws = aws.ap-northeast-3
#  }
#  enable = contains(var.target_regions, "ap-northeast-3") && var.enable_ebs_baseline
#}
#
#module "baseline_ebs_ap-south-1" {
#  source = "./modules/baseline_ebs"
#  providers = {
#    aws = aws.ap-south-1
#  }
#  enable = contains(var.target_regions, "ap-south-1") && var.enable_ebs_baseline
#}
#
#module "baseline_ebs_ap-southeast-1" {
#  source = "./modules/baseline_ebs"
#  providers = {
#    aws = aws.ap-southeast-1
#  }
#  enable = contains(var.target_regions, "ap-southeast-1") && var.enable_ebs_baseline
#}
#
#module "baseline_ebs_ap-southeast-2" {
#  source = "./modules/baseline_ebs"
#  providers = {
#    aws = aws.ap-southeast-2
#  }
#  enable = contains(var.target_regions, "ap-southeast-2") && var.enable_ebs_baseline
#}
#
#module "baseline_ebs_ca-central-1" {
#  source = "./modules/baseline_ebs"
#  providers = {
#    aws = aws.ca-central-1
#  }
#  enable = contains(var.target_regions, "ca-central-1") && var.enable_ebs_baseline
#}
#
#module "baseline_ebs_eu-central-1" {
#  source = "./modules/baseline_ebs"
#  providers = {
#    aws = aws.eu-central-1
#  }
#  enable = contains(var.target_regions, "eu-central-1") && var.enable_ebs_baseline
#}
#
#module "baseline_ebs_eu-north-1" {
#  source = "./modules/baseline_ebs"
#  providers = {
#    aws = aws.eu-north-1
#  }
#  enable = contains(var.target_regions, "eu-north-1") && var.enable_ebs_baseline
#}

module "baseline_ebs_eu-west-1" {
  source = "./modules/baseline_ebs"
  providers = {
    aws = aws.eu-west-1
  }
  enable = contains(var.target_regions, "eu-west-1") && var.enable_ebs_baseline
}

#module "baseline_ebs_eu-west-2" {
#  source = "./modules/baseline_ebs"
#  providers = {
#    aws = aws.eu-west-2
#  }
#  enable = contains(var.target_regions, "eu-west-2") && var.enable_ebs_baseline
#}
#
#module "baseline_ebs_eu-west-3" {
#  source = "./modules/baseline_ebs"
#  providers = {
#    aws = aws.eu-west-3
#  }
#  enable = contains(var.target_regions, "eu-west-3") && var.enable_ebs_baseline
#}
#
#module "baseline_ebs_sa-east-1" {
#  source = "./modules/baseline_ebs"
#  providers = {
#    aws = aws.sa-east-1
#  }
#  enable = contains(var.target_regions, "sa-east-1") && var.enable_ebs_baseline
#}

module "baseline_ebs_us-east-1" {
  source = "./modules/baseline_ebs"
  providers = {
    aws = aws.us-east-1
  }
  enable = contains(var.target_regions, "us-east-1") && var.enable_ebs_baseline
}

module "baseline_ebs_us-east-2" {
  source = "./modules/baseline_ebs"
  providers = {
    aws = aws.us-east-2
  }
  enable = contains(var.target_regions, "us-east-2") && var.enable_ebs_baseline
}

#module "baseline_ebs_us-west-1" {
#  source = "./modules/baseline_ebs"
#  providers = {
#    aws = aws.us-west-1
#  }
#  enable = contains(var.target_regions, "us-west-1") && var.enable_ebs_baseline
#}
#
#module "baseline_ebs_us-west-2" {
#  source = "./modules/baseline_ebs"
#  providers = {
#    aws = aws.us-west-2
#  }
#  enable = contains(var.target_regions, "us-west-2") && var.enable_ebs_baseline
#}
