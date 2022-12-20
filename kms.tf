# Manage KMS keys

locals {
  non_master_account_arn  = data.aws_organizations_organization.current.non_master_accounts == null ? [] : [ for id in data.aws_organizations_organization.current.non_master_accounts[*].id : "arn:aws:iam::${id}:root" ]
}

data "aws_iam_policy_document" "kms_share" {
  statement {
    actions     = ["kms:*"]
    sid         = "Enable IAM User Permissions"
    effect      = "Allow"
    principals  { 
      type        = "AWS"
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.id}:root"]
    }
    resources   = ["*"]
  }
  statement {
    sid         = "Allow an external account to use this KMS key"
    effect      = "Allow"
    principals  {
      type        = "AWS"
      identifiers = local.non_master_account_arn
    }
    actions     = [
      "kms:Encrypt",
      "kms:Decrypt",
      "kms:ReEncrypt*",
      "kms:GenerateDataKey*",
      "kms:DescribeKey"
    ]
    resources   = ["*"]
  }
}

# CloudTrail
#   key in region where S3 bucket is. Can be cross account
# EBS
#   regional replicas
# S3
#
# SNS

module "kms-cloudtrail" {
  count                       = var.enable_kms && var.account_type == "master" && contains(var.target_regions, "us-east-1") ? 1 : 0
  #count                       = var.enable_kms && contains(var.target_regions, "us-east-1") ? 1 : 0
  source                      = "./modules/kms"
  enable                      = var.enable_kms && contains(var.target_regions, "us-east-1")
  alias                       = "alias/org_cloudtrail"
  name                        = "org_cloudtrail"
  deletion_window_in_days     = 7
  description                 = "Appzen Org cloudtrail KMS multregion and multiaccount"
  enable_key_rotation         = true
  multi_region                = true
  policy                      = data.aws_iam_policy_document.kms_share.json
  #replica_deletion_window_in_days =
  #replica                     = false
  #replica_policy              =
  tags                        = var.tags
  providers = {
    aws                 = aws.us-east-1
    aws.primary_kms_key = aws.us-east-1
  }
}

# CloudTrail KMS policy
# Allow access to all accounts and regions - Not needed for org controlled trail
#{
#    "Sid": "Allow CloudTrail to encrypt logs",
#    "Effect": "Allow",
#    "Principal":
#    {
#        "Service": "cloudtrail.amazonaws.com"
#    },
#    "Action": "kms:GenerateDataKey*",
#    "Resource": "*",
#    "Condition":
#    {
#        "StringLike":
#        {
#            "kms:EncryptionContext:aws:cloudtrail:arn": "arn:aws:cloudtrail:*:<Mgmt-Account-Number>:trail/*"
#        }
#    }
#}
# Need map entry for management account only
# aws_organizations_organization.self.accounts[*].id
#  member_account_ids = sort(data.aws_organizations_organization.org.accounts[*].id)
#  values = formatlist("arn:aws:cloudtrail::%s:trail/*", local.member_account_ids)

#<Account-KMS><Key-ARN>
#<Account-CloudTrail><Trail-ARN>
#<Account-S3><S3-Bucket-ARN>
#
#{
#    "Version": "2012-10-17",
#    "Id": "Key policy created by CloudTrail",
#    "Statement":
#    [
#        {
#            "Sid": "Enable IAM User Permissions",
#            "Effect": "Allow",
#            "Principal":
#            {
#                "AWS":
#                [
#                    "arn:aws:iam::<Account-KMS>:root",
#                    "arn:aws:iam::<Account-KMS>:user/username"
#                ]
#            },
#            "Action": "kms:*",
#            "Resource": "<S3-Bucket-ARN>"
#        },
#        {
#            "Sid": "Allow CloudTrail to encrypt logs",
#            "Effect": "Allow",
#            "Principal":
#            {
#                "Service":
#                [
#                    "cloudtrail.amazonaws.com"
#                ]
#            },
#            "Action": "kms:GenerateDataKey*",
#            "Resource": "<Key-ARN>",
#            "Condition":
#            {
#                "StringLike":
#                {
#                    "kms:EncryptionContext:aws:cloudtrail:arn": "arn:aws:cloudtrail:*:<Account-CloudTrail>:trail/*"
#                }
#            }
#        },
#        {
#            "Sid": "Allow CloudTrail to describe key",
#            "Effect": "Allow",
#            "Principal":
#            {
#                "Service":
#                [
#                    "cloudtrail.amazonaws.com"
#                ]
#            },
#            "Action": "kms:DescribeKey",
#            "Resource": "<Key-ARN>"
#        },
#        {
#            "Sid": "Allow principals in the account to decrypt log files",
#            "Effect": "Allow",
#            "Principal":
#            {
#                "AWS": "*"
#            },
#            "Action":
#            [
#                "kms:Decrypt",
#                "kms:ReEncryptFrom"
#            ],
#            "Resource": "<Key-ARN>",
#            "Condition":
#            {
#                "StringEquals":
#                {
#                    "kms:CallerAccount": "<Account-CloudTrail>"
#                },
#                "StringLike":
#                {
#                    "kms:EncryptionContext:aws:cloudtrail:arn": "arn:aws:cloudtrail:*:<Account-CloudTrail>:trail/*"
#                }
#            }
#        },
#        {
#            "Sid": "Allow alias creation during setup",
#            "Effect": "Allow",
#            "Principal":
#            {
#                "AWS": "*"
#            },
#            "Action": "kms:CreateAlias",
#            "Resource": "<Key-ARN>",
#            "Condition":
#            {
#                "StringEquals":
#                {
#                    "kms:ViaService": "ec2.<Region>.amazonaws.com",
#                    "kms:CallerAccount": "<Account-KMS>"
#                }
#            }
#        },
#        {
#            "Sid": "Enable cross account log decryption",
#            "Effect": "Allow",
#            "Principal":
#            {
#                "AWS": "*"
#            },
#            "Action":
#            [
#                "kms:Decrypt",
#                "kms:ReEncryptFrom"
#            ],
#            "Resource": "<Key-ARN>",
#            "Condition":
#            {
#                "StringEquals":
#                {
#                    "kms:CallerAccount": "<Account-S3>"
#                },
#                "StringLike":
#                {
#                    "kms:EncryptionContext:aws:cloudtrail:arn": "arn:aws:cloudtrail:*:<Account-CloudTrail>:trail/*"
#                }
#            }
#        }
#    ]
#}
#
