
### -------------------------
### S3 Buckets
### -------------------------

## TODO; Make these all dynamic to only include enabled S3 buckets
#output "s3_bucket_arns" {
#  description = "S3 Bucket ARNs"
#  value       = local.s3_bucket_arns
#}
#output "s3_bucket_names" {
#  description = "S3 Bucket Names"
#  value       = local.s3_bucket_names
#}
#output "s3_bucket_region_arn_map" {
#  description = "Map of regions and S3 ARNs"
#  #value       = zipmap(local.s3_bucket_regions, local.s3_bucket_arns)
#  value = zipmap(
#    local.s3_bucket_regions,
#    matchkeys(local.s3_bucket_arns, local.s3_bucket_regions, var.target_regions)
#  )
#}
#output "s3_bucket_region_name_map" {
#  description = "Map of regions and S3 names"
#  #value       = zipmap(local.s3_bucket_regions, local.s3_bucket_names)
#  value = zipmap(
#    local.s3_bucket_regions,
#    matchkeys(local.s3_bucket_names, local.s3_bucket_regions, var.target_regions)
#  )
#}
