
variable "account_type" {
  description = "AWS account type (master, administrator, log, member)"
  type        = string
  validation {
    condition = contains(
      ["master", "administrator", "log", "member"],
      var.account_type
    )
    error_message = "Must be one of: master, administrator, log, member."
  }
}
variable "delivery_channel_name" {
  description = ""
  type        = string
}

variable "delivery_frequency" {
  description = "The frequency with which AWS Config delivers configuration snapshots."
  type        = string
  default     = "TwentyFour_Hours"
  validation {
    condition = contains(
      ["One_Hour", "Three_Hours", "Six_Hours", "Twelve_Hours", "TwentyFour_Hours"],
      var.delivery_frequency
    )
    error_message = "Must be one of: One_Hour, Three_Hours, Six_Hours, Twelve_Hours, TwentyFour_Hours."
  }
}

variable "enable" {
  description = "Enable AWS Config and delegate administrator"
  type        = bool
  default     = true
}

variable "security_administrator_account_id" {
  description = "AWS Security Administrator Account ID"
  type        = number
}

variable "iam_role_arn" {
  description = ""
  type        = string
  default     = ""
}
variable "include_global_resource_types" {
  description = ""
  type        = bool
  default     = false
}
variable "primary_region" {
  description = ""
  type        = string
  default     = ""
}
variable "org_aggregator_name" {
  description = "Name of the organization aggregator"
  type        = string
  default     = "org"
}
variable "org_aggregator_role_name" {
  description = "Name of the organization aggregator IAM role"
  type        = string
  default     = "config-org-access"
}
variable "recorder_name" {
  description = ""
  type        = string
}
variable "s3_bucket_name" {
  description = ""
  type        = string
}

variable "s3_key_prefix" {
  description = ""
  type        = string
  default     = ""
}
variable "sns_topic_kms_master_key_id" {
  description = ""
  type        = string
  default     = ""
}
variable "sns_topic_name" {
  description = ""
  type        = string
  default     = ""
}
variable "tags" {
  description = "Specifies object tags key and value. This applies to all resources created by this module."
  type        = map(any)
  default = {
    "Environment" = "infra"
    "Product"     = "security"
    "Terraform"   = true
  }
}
