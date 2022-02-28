
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

variable "enable" {
  description = "Enable AWS GuardDuty and delegate administrator"
  type        = bool
  default     = true
}

variable "finding_publishing_frequency" {
  description = "Frequency of notifications sent for findings (FIFTEEN_MINUTES, ONE_HOUR, SIX_HOURS)"
  type        = string
  validation {
    condition = contains(
      ["FIFTEEN_MINUTES", "ONE_HOUR", "SIX_HOURS"],
      var.finding_publishing_frequency
    )
    error_message = "Must be one of: FIFTEEN_MINUTES, ONE_HOUR, SIX_HOURS."
  }
  default = "FIFTEEN_MINUTES"
}

variable "security_administrator_account_id" {
  description = "AWS Security Administrator Account ID"
  type        = number
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
