
variable "enable_log_file_validation" {
  description = "Specifies whether log file integrity validation is enabled. Creates signed digest for validated contents of logs"
  type        = bool
  default     = true
}

variable "enable_logging" {
  description = "Enable logging for the trail"
  type        = bool
  default     = true
}

variable "include_global_service_events" {
  description = "Specifies whether the trail is publishing events from global services such as IAM to the log files"
  type        = bool
  default     = true
}

variable "insight_selector" {
  description = "Specifies an insight selector for identifying unusual operational activity. See: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudtrail#insight_type details for this variable"
  type = list(object({
    insight_type = string
  }))

  default = [
    { insight_type = "ApiCallRateInsight" },
    { insight_type = "ApiErrorRateInsight" }
  ]
}

variable "is_multi_region_trail" {
  description = "Specifies whether the trail is created in the current region or in all regions"
  type        = bool
  default     = true
}

variable "is_organization_trail" {
  description = "The trail is an AWS Organizations trail"
  type        = bool
  default     = true
}

variable "name" {
  description = "CloudTrail name"
  type        = string
}

variable "s3_bucket_name" {
  description = "S3 bucket name for CloudTrail logs"
  type        = string
}

variable "s3_key_prefix" {
  description = "Specifies the S3 key prefix that follows the name of the bucket you have designated for log file delivery."
  type        = string
  default     = null
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
