
variable "account_type" {
  description = "AWS account type (master, administrator, member)"
  type        = string
}

variable "enable" {
  description = "Enable AWS Inspector and delegate administrator"
  type        = bool
  default     = true
}

variable "security_administrator_account_id" {
  description = "AWS Security Administrator Account ID"
  type        = number
}
