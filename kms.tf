# Manage KMS keys

locals {
  non_master_account_arn  = data.aws_organizations_organization.current.non_master_accounts == null ? [] : [ for id in data.aws_organizations_organization.current.non_master_accounts[*].id : "arn:aws:kms::${id}:key/*" ]
}

provider "aws" {
  alias   = "use1"
  region  = "us-east-1"
}
provider "aws" {
  alias   = "use2"
  region  = "us-east-2"
}
provider "aws" {
  alias   = "euw1"
  region  = "eu-west-1"
}

data "aws_iam_policy_document" "kms_share" {
  statement {
    actions     = ["kms:*"]
    sid         = "200"
    effect      = "Allow"
    principals  { 
      type        = "AWS"
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.id}:root"]
    }
    resources   = ["*"]
  }
  statement {
    sid         = "210"
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

data "aws_iam_policy_document" "iam_kms" {
  statement {
    actions     = ["kms:*"]
    sid         = "200"
    effect      = "Allow"
    resources   = ["arn:aws:kms::${data.aws_caller_identity.current.id}:key/*"]
    #resources   = ["*"]
  }
  statement {
    sid         = "210"
    effect      = "Allow"
    actions     = [
      "kms:Encrypt",
      "kms:Decrypt",
      "kms:ReEncrypt*",
      "kms:GenerateDataKey*",
      "kms:DescribeKey"
    ]
    #resources   = ["*"]
    resources   = local.non_master_account_arn
  }
}

resource "aws_iam_policy" "policy" {
  count = var.enable_kms && var.account_type != "master" ? 1 : 0
  name        = "org_kms-policy"
  description = "ORG kms policy 3"
  policy      = data.aws_iam_policy_document.iam_kms.json
}

resource "aws_iam_role" "org_kms_role" {
  count = var.enable_kms && var.account_type != "master" ? 1 : 0
  name = "org_kms-iam-role-for-grant"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "cloudtrail.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": "100"
    }
  ]
}
EOF
}

resource "aws_kms_grant" "org_kms" {
  count = var.enable_kms && var.kms_key_id != "" && var.account_type != "master" ? 1 : 0
  name              = "org_kms-grant"
  key_id            = var.kms_key_id
  grantee_principal = aws_iam_role.org_kms_role[0].arn
  operations        = ["Encrypt", "Decrypt", "GenerateDataKey"]
}

# CloudTrail
#   key in region where S3 bucket is. Can be cross account
# EBS
#   regional replicas
# S3
#
# SNS

module "kms-cloudtrail-us-east-1" {
  count                       = var.enable_kms && var.account_type == "master" && contains(var.target_regions, "us-east-1") ? 1 : 0
  #count                       = var.enable_kms && contains(var.target_regions, "us-east-1") ? 1 : 0
  source                      = "./modules/kms"
  enable                      = var.enable_kms && contains(var.target_regions, "us-east-1")
  account_type                = var.account_type
  alias                       = "org_cloudtrail"
  name                        = "org_cloudtrail"
  deletion_window_in_days     = var.deletion_window_in_days
  description                 = "Appzen Org cloudtrail KMS multregion and multiaccount"
  enable_key_rotation         = true
  multi_region                = true
  policy                      = data.aws_iam_policy_document.kms_share.json
  org_master_account_id       = var.org_master_account_id
  org_primary_region          = var.org_primary_region
  replica_deletion_window_in_days = 7
  replica                     = false
  replica_policy              = ""
  tags                        = var.tags
  providers = {
    aws                 = aws.use1
    aws.primary         = aws.use1
  }
}

module "kms-cloudtrail-eu-west-1" {
  count                       = var.enable_kms && var.account_type == "master" && contains(var.target_regions, "eu-west-1") ? 1 : 0
  #count                       = var.enable_kms && contains(var.target_regions, "eu-west-1") ? 1 : 0
  source                      = "./modules/kms"
  enable                      = var.enable_kms && contains(var.target_regions, "eu-west-1")
  alias                       = "org_cloudtrail"
  name                        = "org_cloudtrail"
  deletion_window_in_days     = var.deletion_window_in_days
  description                 = "Appzen Org cloudtrail KMS multregion and multiaccount"
  enable_key_rotation         = true
  multi_region                = true
  policy                      = data.aws_iam_policy_document.kms_share.json
  org_master_account_id       = var.org_master_account_id
  org_primary_region          = var.org_primary_region
  replica_deletion_window_in_days = var.deletion_window_in_days
  replica                     = true
  replica_policy              = ""
  tags                        = var.tags
  providers = {
    aws                 = aws.euw1
    aws.primary         = aws.use1
  }
}

module "kms-cloudtrail-us-east-2" {
  count                           = var.enable_kms && var.account_type == "master" && contains(var.target_regions, "us-east-2") ? 1 : 0
  source                          = "./modules/kms"
  enable                          = var.enable_kms && contains(var.target_regions, "us-east-2")
  alias                           = "org_cloudtrail"
  name                            = "org_cloudtrail"
  deletion_window_in_days         = var.deletion_window_in_days
  description                     = "Appzen Org cloudtrail KMS multregion and multiaccount"
  enable_key_rotation             = true
  multi_region                    = true
  policy                          = data.aws_iam_policy_document.kms_share.json
  org_master_account_id       = var.org_master_account_id
  org_primary_region          = var.org_primary_region
  replica_deletion_window_in_days = var.deletion_window_in_days
  replica                         = true
  replica_policy                  = ""
  tags                            = var.tags
  providers = {
    aws         = aws.use2
    aws.primary = aws.use1
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
