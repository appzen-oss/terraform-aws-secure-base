
### -------------------------
### S3 Buckets
### -------------------------

output "s3_bucket_arns" {
  description = "S3 Bucket ARNs"
  value       = local.s3_bucket_arns
}
output "s3_bucket_names" {
  description = "S3 Bucket Names"
  value       = local.s3_bucket_names
}
output "s3_bucket_region_arn_map" {
  description = "Map of regions and S3 ARNs"
  value       = local.s3_bucket_region_arn_map
}
output "s3_bucket_region_name_map" {
  description = "Map of regions and S3 names"
  value       = local.s3_bucket_region_name_map
}

output "cloudtrail-us-east-1" {
  description = "Map of regions and S3 names"
  value       = module.kms-cloudtrail-us-east-1
}

output "region_enabled" {
  value       = local.region_enabled
}

output "region_filter" {
  value       = local.region_filter
}

output "region_list" {
  value       = local.region_list
}
