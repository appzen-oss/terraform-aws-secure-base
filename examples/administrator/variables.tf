
variable "account_type" {
  description = "AWS account type (master, administrator, member)"
  type        = string
  validation {
    condition = contains(
      ["master", "administrator", "member"],
      var.account_type
    )
    error_message = "Must be one of: master, administrator, member."
  }
}
variable "aws_profile" {
  description = "AWS credential profile"
  type        = string
}

variable "aws_region" {
  description = "The AWS region in which global resources are set up."
  default     = "us-east-1"
}

#variable "enable_artifact" {
#  description = "Enable AWS Artifact service"
#  type        = bool
#  default     = false
#}
variable "enable_cloudtrail" {
  description = "Enable AWS CloudTrail service"
  type        = bool
  default     = true
}
#variable "enable_compute_optimzer" {
#  description = "Enable AWS Compute Optimizer service"
#  type        = bool
#  default     = true
#}
variable "enable_config" {
  description = "Enable AWS Config service"
  type        = bool
  default     = true
}
#variable "enable_detective" {
#  description = "Enable AWS Detective service"
#  type        = bool
#  default     = false
#}
variable "enable_firewall_manager" {
  description = "Enable AWS Firewall Manager service"
  type        = bool
  default     = true
}
variable "enable_guardduty" {
  description = "Enable AWS GuardDuty service"
  type        = bool
  default     = true
}
variable "enable_iam_access_analyzer" {
  description = "Enable AWS IAM Access Analyzer"
  type        = bool
  default     = true
}
#variable "enable_inspector" {
#  description = "Enable AWS Inspector"
#  type        = bool
#  default     = false
#}
#variable "enable_ram" {
#  description = "Enable AWS RAM service"
#  type        = bool
#  default     = true
#}
#variable "enable_s3_storage_lens" {
#  description = "Enable AWS S3 Storage Lens service"
#  type        = bool
#  default     = true
#}
variable "enable_securityhub" {
  description = "Enable AWS Security Hub service"
  type        = bool
  default     = true
}
#variable "enable_tag_policies" {
#  description = "Enable AWS Tag Policies"
#  type        = bool
#  default     = true
#}

variable "security_administrator_account_id" {
  description = "AWS Security Administrator Account ID"
  type        = number
}

variable "tags" {
  description = "Specifies object tags key and value. This applies to all resources created by this module."
  default = {
    "Environment" = "infra"
    "Product"     = "security"
    "Team"        = "devops"
    "Terraform"   = true
  }
}

variable "target_regions" {
  description = "A list of regions to set up with this module."
  default = [
    "eu-west-1",
    "us-east-1",
    "us-east-2"
  ]
}

### -----------------------------
### Baseline ECR
### -----------------------------
variable "enable_ecr_baseline" {
  description = "Enable ECR image scanning"
  type        = bool
  default     = true
}
# scan_frequency = "SCAN_ON_PUSH" "CONTINUOUS_SCAN" "MANUAL"
variable "ecr_scanning_rules" {
  description = "List of ECR scanning rules"
  type        = list(map(string))
  default = [
    {
      frequency = "SCAN_ON_PUSH"
      filter    = "*"
    }
  ]
}
variable "ecr_scan_type" {
  description = "ECR scanning type (BASIC or ENHANCED)"
  type        = string
  validation {
    condition = contains(
      ["BASIC", "ENHANCED"],
      var.ecr_scan_type
    )
    error_message = "Must be one of: BASIC, ENHANCED."
  }
  default = "BASIC"
  #default = "ENHANCED" # Need inspector2 to collect data
}

### -----------------------------
### Baseline EBS
### -----------------------------
variable "enable_ebs_baseline" {
  description = "Boolean whether iam-baseline is enabled."
  default     = true
}
### -----------------------------
### Baseline IAM
### -----------------------------
variable "enable_iam_baseline" {
  description = "Boolean whether iam-baseline is enabled."
  default     = true
}

variable "iam_create_password_policy" {
  type        = bool
  description = "Define if the password policy should be created."
  default     = true
}

#variable "iam_create_master_role" {
#  type        = bool
#  description = "Define if the master role should be created."
#  default     = true
#}
#
#variable "iam_create_manager_role" {
#  type        = bool
#  description = "Define if the manager role should be created."
#  default     = true
#}

#variable "iam_create_support_role" {
#  type        = bool
#  description = "Define if the support role should be created."
#  default     = true
#}

#variable "iam_master_iam_role_name" {
#  description = "The name of the IAM Master role."
#  default     = "IAM-Master"
#}
#
#variable "iam_master_iam_role_policy_name" {
#  description = "The name of the IAM Master role policy."
#  default     = "IAM-Master-Policy"
#}
#
#variable "iam_manager_iam_role_name" {
#  description = "The name of the IAM Manager role."
#  default     = "IAM-Manager"
#}
#
#variable "iam_manager_iam_role_policy_name" {
#  description = "The name of the IAM Manager role policy."
#  default     = "IAM-Manager-Policy"
#}

#variable "iam_support_iam_role_name" {
#  description = "The name of the the support role."
#  default     = "IAM-Support"
#}
#
#variable "iam_support_iam_role_policy_name" {
#  description = "The name of the support role policy."
#  default     = "IAM-Support-Role"
#}
#
#variable "iam_support_iam_role_principal_arns" {
#  type        = list(any)
#  description = "List of ARNs of the IAM principal elements by which the support role could be assumed."
#}

variable "iam_max_password_age" {
  description = "The number of days that an user password is valid."
  default     = 0
}

variable "iam_minimum_password_length" {
  description = "Minimum length to require for user passwords."
  default     = 14
}

variable "iam_password_reuse_prevention" {
  description = "The number of previous passwords that users are prevented from reusing."
  default     = 24
}

variable "iam_require_lowercase_characters" {
  description = "Whether to require lowercase characters for user passwords."
  default     = true
}

variable "iam_require_numbers" {
  description = "Whether to require numbers for user passwords."
  default     = true
}

variable "iam_require_uppercase_characters" {
  description = "Whether to require uppercase characters for user passwords."
  default     = true
}

variable "iam_require_symbols" {
  description = "Whether to require symbols for user passwords."
  default     = true
}

variable "iam_allow_users_to_change_password" {
  description = "Whether to allow users to change their own password."
  default     = true
}

### -----------------------------
### Baseline S3
### -----------------------------
variable "enable_s3_baseline" {
  description = "Enable S3 baseline?"
  default     = true
}

variable "s3_block_public_acls" {
  description = "Whether Amazon S3 should block public ACLs for buckets in this account. Defaults to true."
  default     = true
}

variable "s3_block_public_policy" {
  description = "Whether Amazon S3 should block public bucket policies for buckets in this account. Defaults to true."
  default     = true
}

variable "s3_ignore_public_acls" {
  description = "Whether Amazon S3 should ignore public ACLs for buckets in this account. Defaults to true."
  default     = true
}

variable "s3_restrict_public_buckets" {
  description = "Whether Amazon S3 should restrict public bucket policies for buckets in this account. Defaults to true."
  default     = true
}

### -----------------------------
### S3 Bucket
### -----------------------------
variable "enable_s3_buckets" {
  description = "Enable S3 buckets?"
  type        = bool
  default     = false
}
variable "bucket_custom_policy_json" {
  description = "Custom S3 bucket policy override JSON"
  type        = string
  default     = ""
}
variable "cloudtrail_s3_key_prefix" {
  description = "S3 key prefix for CloudTrail"
  type        = string
  default     = "cloudtrail"
}
variable "config_s3_bucket_key_prefix" {
  description = "S3 key prefix for Config"
  type        = string
  default     = "config"
}
variable "vpc_flow_logs_s3_key_prefix" {
  description = "S3 key prefix for VPC Flow Logs"
  type        = string
  default     = "flow-logs"
}

variable "force_destroy" {
  description = "Allow destroy of S3 bucket with objects"
  type        = bool
  default     = false
}

#variable "kms_master_key_arn" {
#  description = "The AWS KMS master key ARN used for the `SSE-KMS` encryption. The default aws/s3 AWS AES256 master key is used if this element is absent"
#  type        = string
#  default     = ""
#}

### -----------------------------
### Organization Settings
### -----------------------------
# Policy Types
#variable "enable_org_policy_aiservices" {
#  description = "Enable organization policy type for AI services opt-out"
#  type        = bool
#  default     = true
#}
#
#variable "enable_org_policy_backup" {
#  description = "Enable organization policy type for backup"
#  type        = bool
#  default     = false
#}
#
#variable "enable_org_policy_scp" {
#  description = "Enable organization policy type for service cache_control"
#  type        = bool
#  default     = true
#}
