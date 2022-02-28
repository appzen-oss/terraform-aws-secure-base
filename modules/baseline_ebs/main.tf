
#data "aws_region" "current" {}

# --------------------------------------------------------------------------------------------------
# Default KMS Encryption Key for EBS
# --------------------------------------------------------------------------------------------------
# Create key per region (all primary) or 1 key and replicate to each region

# Primary Region
#resource "aws_kms_key" "ebs" {
#  count = var.enable ? 1 : 0
#  description             = "EBS Default Encryption Key"
#  deletion_window_in_days = 30
#  multi_region =
#  policy =
#  tags =
#}

# Non-primary Regions
#data "aws_kms_key" "ebs" {  # non-primary regions
#  # provider of region of primary key
#  count = var.enable ? 1 : 0
#  key_id = "alias/ebs-default"
#}
#resource "aws_kms_replica_key" "ebs" {
#  # provider of region to replicate in
#  count = var.enable ? 1 : 0
#  description             = "Multi-Region replica key"
#  deletion_window_in_days = 7
#  primary_key_arn         = data.aws_kms_key.ebs.arn   # non-primary regions
#  # same args as kms_key
#}

#resource "aws_kms_alias" "ebs" {
#  count = var.enable ? 1 : 0
#  name          = "alias/ebs-default"
#  target_key_id = aws_kms_key.ebs.key_id           # primary region
#  target_key_id = aws_kms_replica_key.ebs.key_id   # non-primary regions
#}

#resource "aws_ebs_default_kms_key" "self" {
#  count = var.enable ? 1 : 0
#  key_arn = aws_kms_key.ebs.arn            # primary region
#  key_arn = aws_kms_replica_key.ebs.arn    # non-primary regions
#}

# --------------------------------------------------------------------------------------------------
# Enable Default EBS Encryption
# --------------------------------------------------------------------------------------------------
resource "aws_ebs_encryption_by_default" "self" {
  count   = var.enable ? 1 : 0
  enabled = true
}
