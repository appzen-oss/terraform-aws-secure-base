
# Manage SCP policies

locals {
  enable = var.enable && var.account_type == "master"
}
### -----------------------
### CloudTrail
### -----------------------
resource "aws_organizations_policy" "deny_cloudtrail_disable" {
  count       = local.enable && var.enable_cloudtrail ? 1 : 0
  name        = "deny_cloudtrail_disable"
  description = "Prevent CloudTrail from beings disabled"
  tags        = var.tags
  type        = "SERVICE_CONTROL_POLICY"
  content     = file("files/deny-cloudtrail-disable.json")
  # templatefile(path, vars)
}
resource "aws_organizations_policy" "deny_cloudtrail_tamper" {
  count       = local.enable && var.enable_cloudtrail ? 1 : 0
  name        = "deny_cloudtrail_tamper"
  description = "Prevent CloudTrail trails from beings tampered with"
  tags        = var.tags
  type        = "SERVICE_CONTROL_POLICY"
  content     = file("files/deny-cloudtrail-tamper.json")
}
### -----------------------
### Config
### -----------------------
resource "aws_organizations_policy" "deny_config_modify" {
  count       = local.enable && var.enable_config ? 1 : 0
  name        = "deny_config_modify"
  description = "Prevent Config from beings tampered with"
  tags        = var.tags
  type        = "SERVICE_CONTROL_POLICY"
  content     = file("files/deny-config-modify.json")
}
### -----------------------
### EBS
### -----------------------
#   deny change default encryption
### -----------------------
### ECR
### -----------------------
resource "aws_organizations_policy" "deny_ecr_create_write" {
  count       = local.enable && var.enable_ecr ? 1 : 0
  name        = "deny_ecr_create_write"
  description = "Prevent ECR from being created or written too"
  tags        = var.tags
  type        = "SERVICE_CONTROL_POLICY"
  content     = file("files/deny-ecr-create-write.json")
}
### -----------------------
### GuardDuty
### -----------------------
resource "aws_organizations_policy" "deny_guardduty_modify" {
  count       = local.enable && var.enable_guardduty ? 1 : 0
  name        = "deny_guardduty_modify"
  description = "Prevent GuardDuty from being modified"
  tags        = var.tags
  type        = "SERVICE_CONTROL_POLICY"
  content     = file("files/deny-guardduty-modify.json")
}
### -----------------------
### IAM
### -----------------------
#resource "aws_organizations_policy" "deny_iam_password_policy_modify" {
#  count = local.enable && var.enable_iam ? 1 : 0
#  name = "deny_iam_password_policy_modify"
#  description = "Prevent ECR from being created or written too"
#  tags = var.tags
#  type = "SERVICE_CONTROL_POLICY"
#  content = file("files/deny-ecr-create-write.json")
#}
### -----------------------
### Organization
### -----------------------
resource "aws_organizations_policy" "deny_member_leaving" {
  count       = local.enable ? 1 : 0
  name        = "deny_member_leaving"
  description = "Prevent organization member accounts from leaving the organization"
  tags        = var.tags
  type        = "SERVICE_CONTROL_POLICY"
  content     = file("files/deny-member-leaving.json")
}
### -----------------------
### S3
### -----------------------
resource "aws_organizations_policy" "deny_s3_public" {
  count       = local.enable && var.enable_s3 ? 1 : 0
  name        = "deny_s3_public"
  description = "Prevent account S3 public access block from being changed"
  tags        = var.tags
  type        = "SERVICE_CONTROL_POLICY"
  content     = file("files/deny-s3-public.json")
}
resource "aws_organizations_policy" "require_s3_encryption" {
  count       = local.enable && var.enable_s3 ? 1 : 0
  name        = "require_s3_encryption"
  description = "Require S3 service side encryption"
  tags        = var.tags
  type        = "SERVICE_CONTROL_POLICY"
  content     = file("files/require-s3-encryption.json")
}
