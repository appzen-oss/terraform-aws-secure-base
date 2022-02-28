
variable "enable" {
  description = "Enable ECR scanning"
  type        = bool
  default     = true
}

# scan_frequency = "SCAN_ON_PUSH" "CONTINUOUS_SCAN" "MANUAL"
variable "rules" {
  description = "List of ECR scanning rules"
  type        = list(map(string))
  default = [
    {
      frequency = "SCAN_ON_PUSH"
      filter    = "*"
    }
  ]
}

variable "scan_type" {
  description = "ECR scanning type (BASIC or ENHANCED)"
  type        = string
  validation {
    condition = contains(
      ["BASIC", "ENHANCED"],
      var.scan_type
    )
    error_message = "Must be one of: BASIC, ENHANCED."
  }
  default = "BASIC"
}
