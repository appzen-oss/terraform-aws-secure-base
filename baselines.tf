
### ================================================================================================
### Baselines are about base security configuration of non-security resources/services
### ================================================================================================

# CloudTrail


# --------------------------------------------------------------------------------------------------
# IAM Baseline Configuration - Global
# --------------------------------------------------------------------------------------------------
module "baseline_iam" {
  source = "./modules/baseline_iam"
  enable = var.enable_iam_baseline
  #support_iam_role_name           = var.iam_support_iam_role_name
  #support_iam_role_policy_name    = var.iam_support_iam_role_policy_name
  #support_iam_role_principal_arns = var.iam_support_iam_role_principal_arns
  minimum_password_length        = var.iam_minimum_password_length
  password_reuse_prevention      = var.iam_password_reuse_prevention
  require_lowercase_characters   = var.iam_require_lowercase_characters
  require_numbers                = var.iam_require_numbers
  require_uppercase_characters   = var.iam_require_uppercase_characters
  require_symbols                = var.iam_require_symbols
  allow_users_to_change_password = var.iam_allow_users_to_change_password
  max_password_age               = var.iam_max_password_age
  create_password_policy         = var.iam_create_password_policy
  #create_support_role             = var.iam_create_support_role
  tags = var.tags
}

# --------------------------------------------------------------------------------------------------
# S3 Baseline Configuration - Global
# --------------------------------------------------------------------------------------------------
module "baseline_s3" {
  source                  = "./modules/baseline_s3"
  enable                  = var.enable_s3_baseline
  block_public_acls       = var.s3_block_public_acls
  block_public_policy     = var.s3_block_public_policy
  ignore_public_acls      = var.s3_ignore_public_acls
  restrict_public_buckets = var.s3_restrict_public_buckets
}
