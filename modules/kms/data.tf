data "aws_region" "current" {}
data "aws_caller_identity" "current" {}
data "aws_organizations_organization" "current" {}

### Replica KMS Key = Non-primary Regions
data "aws_kms_key" "primary" {
  count    = var.enable && var.replica ? 1 : 0
  key_id   = "arn:aws:kms:${var.org_primary_region}:${var.org_master_account_id}:alias/${var.alias}"
  provider = aws.primary
}
