# Create secure S3 bucket in one region for AWS services

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.4 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.1.0 |
| <a name="requirement_time"></a> [time](#requirement\_time) | >= 0.7.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.2.0 |
| <a name="provider_aws.org-master"></a> [aws.org-master](#provider\_aws.org-master) | 4.2.0 |
| <a name="provider_time"></a> [time](#provider\_time) | 0.7.2 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_label"></a> [label](#module\_label) | cloudposse/label/null | 0.25.0 |

## Resources

| Name | Type |
|------|------|
| [aws_s3_bucket.self](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_acl.self](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl) | resource |
| [aws_s3_bucket_ownership_controls.self](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_ownership_controls) | resource |
| [aws_s3_bucket_policy.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_public_access_block.self](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.self](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [time_sleep.wait_for_aws_s3_bucket_settings](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_account_alias.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_account_alias) | data source |
| [aws_iam_policy_document.aggregated_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.s3_cloud_trail](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.s3_config](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.s3_flow_logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.s3_secure](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_organizations_organization.org](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/organizations_organization) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_custom_policy_json"></a> [bucket\_custom\_policy\_json](#input\_bucket\_custom\_policy\_json) | Custom S3 bucket policy override JSON | `string` | `""` | no |
| <a name="input_cloudtrail_s3_key_prefix"></a> [cloudtrail\_s3\_key\_prefix](#input\_cloudtrail\_s3\_key\_prefix) | S3 key prefix for CloudTrail | `string` | `"cloudtrail"` | no |
| <a name="input_config_s3_bucket_key_prefix"></a> [config\_s3\_bucket\_key\_prefix](#input\_config\_s3\_bucket\_key\_prefix) | S3 key prefix for Config | `string` | `"config"` | no |
| <a name="input_enable"></a> [enable](#input\_enable) | Enable managing S3 buckets | `bool` | `true` | no |
| <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy) | Allow destroy of S3 bucket with objects | `bool` | `false` | no |
| <a name="input_kms_master_key_arn"></a> [kms\_master\_key\_arn](#input\_kms\_master\_key\_arn) | The AWS KMS master key ARN used for the `SSE-KMS` encryption. The default aws/s3 AWS AES256 master key is used if this element is absent | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Specifies object tags key and value. This applies to all resources created by this module. | `map(any)` | <pre>{<br>  "Environment": "infra",<br>  "Product": "security",<br>  "Terraform": true<br>}</pre> | no |
| <a name="input_vpc_flow_logs_s3_key_prefix"></a> [vpc\_flow\_logs\_s3\_key\_prefix](#input\_vpc\_flow\_logs\_s3\_key\_prefix) | S3 key prefix for VPC Flow Logs | `string` | `"flow-logs"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_s3_bucket_arn"></a> [s3\_bucket\_arn](#output\_s3\_bucket\_arn) | S3 Bucket ARN |
| <a name="output_s3_bucket_name"></a> [s3\_bucket\_name](#output\_s3\_bucket\_name) | S3 Bucket Name |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
