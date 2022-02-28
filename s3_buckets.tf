
#locals {
#  is_logs_account = var.logs_account == data.aws_caller_identity.current.account_id
#  s3_bucket_regions = [
#    "eu-west-1",
#    "us-east-1",
#    "us-east-2"
#  ]
#  s3_bucket_arns = [
#    module.s3_bucket-eu-west-1.s3_bucket_arn,
#    module.s3_bucket-us-east-1.s3_bucket_arn,
#    module.s3_bucket-us-east-2.s3_bucket_arn
#  ]
#  s3_bucket_names = [
#    module.s3_bucket-eu-west-1.s3_bucket_name,
#    module.s3_bucket-us-east-1.s3_bucket_name,
#    module.s3_bucket-us-east-2.s3_bucket_name
#  ]
#}
#
# If log account
#module "s3_bucket-eu-west-1" {
#  source                      = "./modules/s3_bucket"
#  enable                     = var.enable_s3_buckets && contains(var.target_regions, "eu-west-1")
#  aws_profile                 = var.aws_profile
#  bucket_custom_policy_json   = var.bucket_custom_policy_json
#  cloudtrail_s3_key_prefix    = var.cloudtrail_s3_key_prefix
#  config_s3_bucket_key_prefix = var.config_s3_bucket_key_prefix
#  force_destroy               = var.force_destroy
#  #kms_master_key_arn          = var.kms_master_key_arn
#  tags                        = var.tags
#  vpc_flow_logs_s3_key_prefix = var.vpc_flow_logs_s3_key_prefix
#  providers = {
#    aws            = aws.eu-west-1
#    aws.org-master = aws.org-master
#  }
#}
#
module "s3_bucket-us-east-1" {
  source                      = "./modules/s3_bucket"
  enable                      = var.enable_s3_buckets && contains(var.target_regions, "us-east-1")
  bucket_custom_policy_json   = var.bucket_custom_policy_json
  cloudtrail_s3_key_prefix    = var.cloudtrail_s3_key_prefix
  config_s3_bucket_key_prefix = var.config_s3_bucket_key_prefix
  force_destroy               = var.force_destroy
  #kms_master_key_arn          = var.kms_master_key_arn
  tags                        = var.tags
  vpc_flow_logs_s3_key_prefix = var.vpc_flow_logs_s3_key_prefix
  providers = {
    aws            = aws.us-east-1
    aws.org-master = aws.org-master
  }
}

#module "s3_bucket-us-east-2" {
#  source                      = "./modules/s3_bucket"
#  enable                     = var.enable_s3_buckets && contains(var.target_regions, "us-east-2")
#  aws_profile                 = var.aws_profile
#  bucket_custom_policy_json   = var.bucket_custom_policy_json
#  cloudtrail_s3_key_prefix    = var.cloudtrail_s3_key_prefix
#  config_s3_bucket_key_prefix = var.config_s3_bucket_key_prefix
#  force_destroy               = var.force_destroy
#  #kms_master_key_arn          = var.kms_master_key_arn
#  tags                        = var.tags
#  vpc_flow_logs_s3_key_prefix = var.vpc_flow_logs_s3_key_prefix
#  providers = {
#    aws            = aws.us-east-2
#    aws.org-master = aws.org-master
#  }
#}
