
### -------------------
### KMS Key
### -------------------

output "alias_arn" {
  description = "KMS Alias ARN"
  value       = one(aws_kms_alias.self.*.arn)
}
output "alias_target_key_arn" {
  description = "KMS Alias target key ARN"
  value       = one(aws_kms_alias.self.*.target_key_arn)
}
output "key_rotation" {
  description = "Key rotation enabled?"
  value       = one(aws_kms_key.self.*.key_rotation_enabled)
  #one(aws_kms_replica_key.self.*.key_rotation_enabled)
}
output "multi_region_configuration" {
  description = "Mulit-region KMS key configuration"
  value       = one(data.aws_kms_key.primary.*.multi_region_configuration)
}
output "primary_key_arn" {
  description = "Primary KMS key ARN"
  value       = one(aws_kms_key.self.*.arn)
  # data.aws_kms_key.primary.*.arn
}
output "primary_key_id" {
  description = "Primary KMS key ID"
  value       = one(aws_kms_key.self.*.key_id)
  # data.aws_kms_key.primary.*.key_id
}
output "replica_alias_arn" {
  description = "Replica KMS key alias"
  value       = one(aws_kms_alias.replica.*.arn)
}
output "replica_alias_target_key_arn" {
  description = "Replica KMS key alias"
  value       = one(aws_kms_alias.replica.*.target_key_arn)
}
output "replica_key_arn" {
  description = "Replica KMS key ARN"
  value       = one(aws_kms_replica_key.self.*.arn)
}
output "replica_key_id" {
  description = "Replica KMS key ID"
  value       = one(aws_kms_replica_key.self.*.key_id)
}
