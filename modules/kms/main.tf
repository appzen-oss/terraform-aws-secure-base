##
## Initial ORG kms key must be created manually.  Otherwise every run of terraform will destroy and recreate KMS key. AWS cli command is in terraform output
##

locals {
  non_master_account_arn  = [ for id in sort(data.aws_organizations_organization.current.non_master_accounts[*].id) : "arn:aws:iam::${id}:root" ]
}

## Replica KMS Key = Non-primary Regions
resource "aws_kms_replica_key" "self" {
  count                   = var.enable && var.replica ? 1 : 0
  deletion_window_in_days = var.replica_deletion_window_in_days
  description             = var.replica_description
  policy                  = var.replica_policy
  primary_key_arn         = data.aws_kms_key.primary[0].arn
  tags                    = var.tags
}

resource "aws_kms_alias" "replica" {
  count         = var.enable  && var.replica ? 1 : 0
  name          = "alias/${var.alias}"
  target_key_id = data.aws_kms_key.primary[0].id
}

/*
## Initial ORG kms key must be created manually.  Otherwise every run of terraform will destroy and recreate KMS key. AWS cli command is in terraform output
# Setup kms key
module "kms_key" {
  source = "cloudposse/kms-key/aws"
  version = "0.12.1"
  #alias                   = var.alias
  alias                   = "alias/org_cloudtrail"
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
*/

