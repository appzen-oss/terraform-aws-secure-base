#data "aws_caller_identity" "current" {}
#data "aws_iam_account_alias" "current" {}
data "aws_region" "current" {}

data "terraform_remote_state" "log" {
  backend = "s3"
  config = {
    bucket         = var.log_remote_state_s3_bucket
    dynamodb_table = var.log_remote_state_dynamodb_table
    key            = var.log_remote_state_s3_key
    profile        = var.log_remote_state_aws_profile
    region         = var.log_remote_state_s3_region
  }
}
