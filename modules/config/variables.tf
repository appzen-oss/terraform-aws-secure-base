
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
  type        = string
  default     = ""
}
variable "primary_region" {
  description = ""
  type        = string
  default     = ""
}
variable "recorder_name" {
  description = ""
  type        = string
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
variable "delivery_channel_name" {
  description = ""
  type        = string
}

variable "delivery_frequency" {
  description = ""
  type        = string
  default     = ""
}

variable "s3_bucket_name" {
  description = ""
  type        = string
  default     = ""
}

variable "s3_key_prefix" {
  description = ""
  type        = string
  default     = ""
}
