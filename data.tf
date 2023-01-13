data "aws_caller_identity" "current" {}
#data "aws_iam_account_alias" "current" {}
data "aws_region" "current" {}
data "aws_organizations_organization" "current" {}

data "aws_regions" "enabled" {
  all_regions = true
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required", "not-opted-in"]
  }
}

data "aws_kms_key" "by_alias" {
  count   = var.kms_key_id == "" ? 0 : 1
  key_id = var.kms_key_id
}
