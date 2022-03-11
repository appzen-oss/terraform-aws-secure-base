
# Manage KMS keys

# CloudTrail
#   regional replicas ??
# EBS
#   regional replicas
# S3
#
# SNS

#module "kms-cloudtrail" {
#  source                      = "./modules/kms"
#  count                       = var.enable_kms && contains(var.target_regions, "us-east-1") ? 1 : 0
#  enable                      = var.enable_kms && contains(var.target_regions, "us-east-1")
#  #alias                       = "appzen/cloudtrail"
#  #customer_master_key_spec    =
#  #deletion_window_in_days     = 30
#  #description                 =
#  #enable_key_rotation         =
#  #key_usage                   =
#  #multi_region                = false
#  #policy                      =
#  #replica_deletion_window_in_days =
#  #replica                     = false
#  #replica_policy              =
#  tags                        = var.tags
#  providers = {
#    aws                 = aws.us-east-1
#    aws.primary_kms_key = aws.us-east-1
#  }
#}

# CloudTrail KMS policy
# Allow access to all accounts and regions
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
