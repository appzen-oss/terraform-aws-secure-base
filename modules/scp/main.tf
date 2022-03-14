
# Manage SCP policies

locals {
  enable = var.enable && var.account_type == "master"
}
### -----------------------
### Access Analyzer
### -----------------------
resource "aws_organizations_policy" "deny_access_analyzer_disable" {
  count       = local.enable && var.enable_access_analyzer ? 1 : 0
  name        = "deny_access_analyzer_disable"
  description = "Prevent IAM Access Analyzer from being disabled"
  tags        = var.tags
  type        = "SERVICE_CONTROL_POLICY"
  content     = file("${path.module}/files/deny-access-analyzer-disable.json")
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
  content     = file("${path.module}/files/deny-cloudtrail-disable.json")
  # templatefile(path, vars)
}
resource "aws_organizations_policy" "deny_cloudtrail_tamper" {
  count       = local.enable && var.enable_cloudtrail ? 1 : 0
  name        = "deny_cloudtrail_tamper"
  description = "Prevent CloudTrail trails from beings tampered with"
  tags        = var.tags
  type        = "SERVICE_CONTROL_POLICY"
  content     = file("${path.module}/files/deny-cloudtrail-tamper.json")
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
  content     = file("${path.module}/files/deny-config-modify.json")
}
### -----------------------
### EBS
### -----------------------
resource "aws_organizations_policy" "deny_ebs_default_encryption_disable" {
  count       = local.enable && var.enable_config ? 1 : 0
  name        = "deny_ebs_default_encryption_disable"
  description = "Prevent EC2 EBS default encyption from being disabled"
  tags        = var.tags
  type        = "SERVICE_CONTROL_POLICY"
  content     = file("${path.module}/files/deny-ebs-default-encryption-disable.json")
}
### -----------------------
### ECR
### -----------------------
resource "aws_organizations_policy" "deny_ecr_create_write" {
  count       = local.enable && var.enable_ecr ? 1 : 0
  name        = "deny_ecr_create_write"
  description = "Prevent ECR from being created or written too"
  tags        = var.tags
  type        = "SERVICE_CONTROL_POLICY"
  content     = file("${path.module}/files/deny-ecr-create-write.json")
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
  content     = file("${path.module}/files/deny-guardduty-modify.json")
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
#  content = file("${path.module}/files/deny-ecr-create-write.json")
#}
# TODO:
#   deny user create
### -----------------------
### Organization
### -----------------------
resource "aws_organizations_policy" "deny_member_leaving" {
  count       = local.enable ? 1 : 0
  name        = "deny_member_leaving"
  description = "Prevent organization member accounts from leaving the organization"
  tags        = var.tags
  type        = "SERVICE_CONTROL_POLICY"
  content     = file("${path.module}/files/deny-member-leaving.json")
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
  content     = file("${path.module}/files/deny-s3-public.json")
}
resource "aws_organizations_policy" "deny_s3_unsecure_requests" {
  count       = local.enable && var.enable_s3 ? 1 : 0
  name        = "deny_s3_unsecure_requests"
  description = "Prevent S3 unsecured requests"
  tags        = var.tags
  type        = "SERVICE_CONTROL_POLICY"
  content     = file("${path.module}/files/deny-s3-unsecure-requests.json")
}
resource "aws_organizations_policy" "require_s3_encryption" {
  count       = local.enable && var.enable_s3 ? 1 : 0
  name        = "require_s3_encryption"
  description = "Require S3 service side encryption"
  tags        = var.tags
  type        = "SERVICE_CONTROL_POLICY"
  content     = file("${path.module}/files/require-s3-encryption.json")
}
### -----------------------
### Security Hub
### -----------------------
resource "aws_organizations_policy" "deny_securityhub_disable" {
  count       = local.enable && var.enable_securityhub ? 1 : 0
  name        = "deny_securityhub_disable"
  description = "Prevent Security Hub from being disabled"
  tags        = var.tags
  type        = "SERVICE_CONTROL_POLICY"
  content     = file("${path.module}/files/deny-securityhub-disable.json")
}
