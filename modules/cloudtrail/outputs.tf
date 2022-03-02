output "cloudtrail_id" {
  value       = module.cloudtrail.cloudtrail_id
  description = "The name of the trail"
}

output "cloudtrail_home_region" {
  value       = module.cloudtrail.cloudtrail_home_region
  description = "The region in which the trail was created"
}

output "cloudtrail_arn" {
  value       = module.cloudtrail.cloudtrail_arn
  description = "The Amazon Resource Name of the trail"
}
