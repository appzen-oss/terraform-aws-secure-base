#data "aws_region" "current" {}

### Replica KMS Key = Non-primary Regions
data "aws_kms_key" "primary" {
  count    = var.enable && var.replica ? 1 : 0
  key_id   = format("alias/%s", var.alias)
  provider = aws.primary_kms_key
}
