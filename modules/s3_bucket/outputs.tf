
### -------------------------------
### S3 Buckets
### -------------------------------

#output "bucket_policy" {
#  # count = local.enable and var.debugging ? 1 : 0
#  description = "(debugging) S3 bucket policy"
#  value       = data.aws_iam_policy_document.aggregated_policy.json
#  #value     = join("", data.aws_iam_policy_document.aggregated_policy.*.json)
#}

output "s3_bucket_arn" {
  description = "S3 Bucket ARN"
  value       = join("", aws_s3_bucket.self.*.arn)
}
output "s3_bucket_name" {
  description = "S3 Bucket Name"
  value       = join("", aws_s3_bucket.self.*.id)
}
