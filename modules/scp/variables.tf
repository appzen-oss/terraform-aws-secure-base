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
  description = "Enable managing SCP policies"
  type        = bool
  default     = true
}
variable "enable_cloudtrail" {
  description = "Manage AWS CloudTrail SCP policies"
  type        = bool
  default     = true
}
variable "enable_config" {
  description = "Manage AWS Config  SCP policies"
  type        = bool
  default     = true
}
variable "enable_ebs" {
  description = "Manage EBS SCP policies"
  type        = bool
  default     = true
}
variable "enable_ecr" {
  description = "Manage ECR SCP policies"
  type        = bool
  default     = true
}
variable "enable_guardduty" {
  description = "Manage AWS GuardDuty SCP policies"
  type        = bool
  default     = true
}
variable "enable_iam" {
  description = "Manage IAM SCP policies"
  type        = bool
  default     = true
}
variable "enable_s3" {
  description = "Manage S3 SCP policies"
  type        = bool
  default     = true
}
variable "tags" {
  description = "Specifies object tags key and value. This applies to all resources created by this module."
  type        = map(any)
  default = {
    "Environment" = "infra"
    "Product"     = "security"
    "Team"        = "devops"
    "Terraform"   = true
  }
}
