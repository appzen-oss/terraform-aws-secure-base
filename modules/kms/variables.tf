
### -------------------
### KMS Key
### -------------------

variable "alias" {
  description = "The display name of the alias. The name must start with the word `alias` followed by a forward slash. If not specified, the alias name will be auto-generated."
  type        = string
  default     = ""
}
variable "customer_master_key_spec" {
  description = "Specifies whether the key contains a symmetric key or an asymmetric key pair and the encryption algorithms or signing algorithms that the key supports. Valid values: `SYMMETRIC_DEFAULT`, `RSA_2048`, `RSA_3072`, `RSA_4096`, `ECC_NIST_P256`, `ECC_NIST_P384`, `ECC_NIST_P521`, or `ECC_SECG_P256K1`."
  type        = string
  default     = "SYMMETRIC_DEFAULT"
  validation {
    condition = contains(
      ["SYMMETRIC_DEFAULT", "RSA_2048", "RSA_3072", "RSA_4096", "ECC_NIST_P256", "ECC_NIST_P384", "ECC_NIST_P521", "ECC_SECG_P256K1"],
      var.customer_master_key_spec
    )
    error_message = "Must be one of: SYMMETRIC_DEFAULT, RSA_2048, RSA_3072, RSA_4096, ECC_NIST_P256, ECC_NIST_P384, ECC_NIST_P521, or ECC_SECG_P256K1."
  }
}
variable "deletion_window_in_days" {
  description = "Duration in days after which the key is deleted after destruction of the resource"
  type        = number
  default     = 30
  validation {
    condition     = 7 <= var.deletion_window_in_days && var.deletion_window_in_days <= 30
    error_message = "Must be between 7 and 30, inclusive."
  }
}
variable "description" {
  description = "The description of the key as viewed in AWS console"
  type        = string
  default     = "KMS master key"
}
variable "enable" {
  description = "Manage KMS key?"
  type        = bool
  default     = true
}
variable "enable_key_rotation" {
  description = "Specifies whether key rotation is enabled"
  type        = bool
  default     = true
}
variable "key_usage" {
  description = "Specifies the intended use of the key. Valid values: `ENCRYPT_DECRYPT` or `SIGN_VERIFY`."
  type        = string
  default     = "ENCRYPT_DECRYPT"
  validation {
    condition = contains(
      ["ENCRYPT_DECRYPT", "SIGN_VERIFY"],
      var.key_usage
    )
    error_message = "Must be one of: ENCRYPT_DECRYPT or SIGN_VERIFY."
  }
}
variable "multi_region" {
  description = "Indicates whether the KMS key is a multi-Region (true) or regional (false) key."
  type        = bool
  default     = false
}
variable "policy" {
  description = "A valid KMS policy JSON document. Note that if the policy document is not specific enough (but still valid), Terraform may view the policy as constantly changing in a terraform plan. In this case, please make sure you use the verbose/specific version of the policy."
  type        = string
  default     = " "
  #validation {
  #  condition = length(regexall("^[[[:space:]] -\xFF]+$", var.policy)) > 1
  #  error_message = "Must match regex."
  #}
}
# Validate:  ^[\x{0009}\x{000A}\x{000D}\x{0020}-\x{00FF}]+$
# regexall("^[\s -\xFF]+$", var.policy) - Returns match - length > 0
# terraform rejecting \s and \xFF even those these are RE2

variable "replica_deletion_window_in_days" {
  description = "Duration in days after which the replica key is deleted after destruction of the resource"
  type        = number
  default     = 30
  validation {
    condition     = 7 <= var.replica_deletion_window_in_days && var.replica_deletion_window_in_days <= 30
    error_message = "Must be between 7 and 30, inclusive."
  }
}
variable "replica" {
  description = "Manage KMS replica key?"
  type        = bool
  default     = false
}
variable "replica_description" {
  description = "The description of the key as viewed in AWS console"
  type        = string
  default     = "Multi-Region replica KMS key"
}
variable "replica_policy" {
  description = "Replica KMS key policy JSON document."
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
