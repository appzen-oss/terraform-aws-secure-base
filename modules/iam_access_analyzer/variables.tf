
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

variable "analyzer_name" {
  description = "The name for the IAM Access Analyzer resource to be created."
  type        = string
  default     = "default-analyzer"
}

variable "enable" {
  description = "Enable AWS IAM Access Analyzer"
  type        = bool
  default     = true
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
