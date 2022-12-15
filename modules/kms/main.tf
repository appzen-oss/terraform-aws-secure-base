locals {
  non_master_account_arn  = [ for id in sort(data.aws_organizations_organization.current.non_master_accounts[*].id) : "arn:aws:iam::${id}:root" ]
}

# Setup kms key
module "kms_key" {
  source = "cloudposse/kms-key/aws"
  version = "0.12.1"
  alias                   = var.alias
  name                    = var.name
  description             = var.description
  deletion_window_in_days = var.deletion_window_in_days
  enable_key_rotation     = var.enable_key_rotation
  multi_region            = var.multi_region
  policy                  = jsonencode(
    {
      "Statement" : [
        {
          "Sid": "Enable IAM User Permissions",
          "Effect": "Allow",
          "Principal": {
              "AWS": "arn:aws:iam::${data.aws_caller_identity.current.id}:root"
          },
          "Action": "kms:*",
          "Resource": "*"
        },
        {
          "Sid": "Allow an external account to use this KMS key",
          "Effect": "Allow",
          "Principal": {
              "AWS": local.non_master_account_arn
          },
          "Action": [
              "kms:Encrypt",
              "kms:Decrypt",
              "kms:ReEncrypt*",
              "kms:GenerateDataKey*",
              "kms:DescribeKey"
          ],
          "Resource": "*"
        }
      ]
    }
  )
  tags                    = var.tags
}



#https://github.com/cloudposse/terraform-aws-kms-key

# Output everything

# Use for EBS, CloudTrail, S3, SNS,
# --------------------------------------------------------------------------------------------------
# KMS Encryption Key
# --------------------------------------------------------------------------------------------------
# Create key per region (all primary) or 1 key and replicate to each region

/*
### Primary KMS Key
##resource "aws_kms_key" "self" {
##  count                    = var.enable && !var.replica ? 1 : 0
##  customer_master_key_spec = var.customer_master_key_spec
##  deletion_window_in_days  = var.deletion_window_in_days
##  description              = var.description
##  enable_key_rotation      = var.enable_key_rotation
##  key_usage                = var.key_usage
##  multi_region             = var.multi_region
##  policy                   = var.policy
##  tags                     = var.tags
##}

##resource "aws_kms_alias" "self" {
##  count         = var.enable && !var.replica ? 1 : 0
##  name          = format("alias/%s", var.alias)
##  target_key_id = aws_kms_key.self.key_id
##}

### Replica KMS Key = Non-primary Regions
##resource "aws_kms_replica_key" "self" {
##  count                   = var.enable && var.replica ? 1 : 0
##  deletion_window_in_days = var.replica_deletion_window_in_days
##  description             = var.replica_description
##  policy                  = var.replica_policy
##  primary_key_arn         = data.aws_kms_key.primary.arn
##  tags                    = var.tags
##}

##resource "aws_kms_alias" "replica" {
##  count         = var.enable && var.replica ? 1 : 0
##  name          = format("alias/%s", var.alias)
##  target_key_id = aws_kms_replica_key.self.key_id
##}

*/

#resource "aws_iam_role" "a" {
#  name = "iam-role-for-grant"
#  assume_role_policy = <<EOF
#{
#  "Version": "2012-10-17",
#  "Statement": [
#    {
#      "Action": "sts:AssumeRole",
#      "Principal": {
#        "Service": "lambda.amazonaws.com"
#      },
#      "Effect": "Allow",
#      "Sid": ""
#    }
#  ]
#}
#EOF
#}

#resource "aws_kms_grant" "a" {
#  name              = "my-grant"
#  key_id            = aws_kms_key.a.key_id
#  grantee_principal = aws_iam_role.a.arn
#  operations        = ["Encrypt", "Decrypt", "GenerateDataKey"]
#
#  constraints {
#    encryption_context_equals = {
#      Department = "Finance"
#    }
#  }
#}

