
variable "enable" {
  description = "Enable managing S3 buckets"
  type        = bool
  default     = true
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

variable "kms_master_key_arn" {
  description = "The AWS KMS master key ARN used for the `SSE-KMS` encryption. The default aws/s3 AWS AES256 master key is used if this element is absent"
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
