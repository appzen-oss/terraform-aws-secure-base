
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
  description = "Enable AWS GuardDuty and delegate administrator"
  type        = bool
  default     = true
}

variable "security_administrator_account_id" {
  description = "AWS Security Administrator Account ID"
  type        = number
}
