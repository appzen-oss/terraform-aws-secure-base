#data "aws_caller_identity" "current" {}
#data "aws_iam_account_alias" "current" {}
#data "aws_region" "current" {}

data "aws_regions" "enabled" {
  all_regions = true
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required", "not-opted-in"]
  }
}
