
### -------------------
### KMS Key
### -------------------

## Cloudposse output https://github.com/cloudposse/terraform-aws-kms-key#outputs
output "alias_arn" {
  description = "KMS Alias ARN"
  value       = module.kms_key.alias_arn
}
output "alias_name" {
  description = "KMS Alias Name"
  value       = module.kms_key.alias_name
}
output "key_arn" {
  description = "KMS Key ARN"
  value       = module.kms_key.key_arn
}
output "key_id" {
  description = "KMS Key ID"
  value       = module.kms_key.key_id
}

/*
output "alias_target_key_arn" {
  description = "KMS Alias target key ARN"
  value       = one(aws_kms_alias.self.*.target_key_arn)
}
output "key_rotation" {
  description = "Key rotation enabled?"
  value = one(compact(concat(
    aws_kms_key.self.*.key_rotation_enabled,
    aws_kms_replica_key.self.*.key_rotation_enabled
  )))
}
output "multi_region_configuration" {
  description = "Mulit-region KMS key configuration"
  value       = one(data.aws_kms_key.primary.*.multi_region_configuration)
}
output "primary_key_arn" {
  description = "Primary KMS key ARN"
  value = one(compact(concat(
    aws_kms_key.self.*.arn,
    data.aws_kms_key.primary.*.arn
  )))
}
output "primary_key_id" {
  description = "Primary KMS key ID"
  value = one(compact(concat(
    aws_kms_key.self.*.key_id,
    data.aws_kms_key.primary.*.key_id
  )))
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
*/
