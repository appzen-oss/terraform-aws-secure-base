# terraform-aws-secure-base

[![Releases](https://img.shields.io/github/v/release/appzen-oss/terraform-aws-secure-base)](https://github.com/appzen-oss/terraform-aws-secure-base/releases/tag/latest)

[Terraform Module Registry](https://registry.terraform.io/modules/appzen-oss/secure-base/aws)

A terraform module to set up an AWS multi-account, multi-region organization
with account/region security setting and security services.

***Module is still a Work in Progress***

## Features

- Designed to delegate management of all security services to dedicated administrator account
- Designed to send all logs to a dedicated log account

## Usage


## Submodules

This module is composed of several submodules, all of which can be used independently.

- [submodules](./modules/)

## Examples

- [examples](./examples/)

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

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_baseline_ebs_eu-west-1"></a> [baseline\_ebs\_eu-west-1](#module\_baseline\_ebs\_eu-west-1) | ./modules/baseline_ebs | n/a |
| <a name="module_baseline_ebs_us-east-1"></a> [baseline\_ebs\_us-east-1](#module\_baseline\_ebs\_us-east-1) | ./modules/baseline_ebs | n/a |
| <a name="module_baseline_ebs_us-east-2"></a> [baseline\_ebs\_us-east-2](#module\_baseline\_ebs\_us-east-2) | ./modules/baseline_ebs | n/a |
| <a name="module_baseline_ecr_eu-west-1"></a> [baseline\_ecr\_eu-west-1](#module\_baseline\_ecr\_eu-west-1) | ./modules/baseline_ecr | n/a |
| <a name="module_baseline_ecr_us-east-1"></a> [baseline\_ecr\_us-east-1](#module\_baseline\_ecr\_us-east-1) | ./modules/baseline_ecr | n/a |
| <a name="module_baseline_ecr_us-east-2"></a> [baseline\_ecr\_us-east-2](#module\_baseline\_ecr\_us-east-2) | ./modules/baseline_ecr | n/a |
| <a name="module_baseline_iam"></a> [baseline\_iam](#module\_baseline\_iam) | ./modules/baseline_iam | n/a |
| <a name="module_baseline_s3"></a> [baseline\_s3](#module\_baseline\_s3) | ./modules/baseline_s3 | n/a |
| <a name="module_cloudtrail"></a> [cloudtrail](#module\_cloudtrail) | ./modules/cloudtrail | n/a |
| <a name="module_firewall_manager_us-east-1"></a> [firewall\_manager\_us-east-1](#module\_firewall\_manager\_us-east-1) | ./modules/firewall_manager | n/a |
| <a name="module_guardduty-eu-west-1"></a> [guardduty-eu-west-1](#module\_guardduty-eu-west-1) | ./modules/guardduty | n/a |
| <a name="module_guardduty-us-east-1"></a> [guardduty-us-east-1](#module\_guardduty-us-east-1) | ./modules/guardduty | n/a |
| <a name="module_guardduty-us-east-2"></a> [guardduty-us-east-2](#module\_guardduty-us-east-2) | ./modules/guardduty | n/a |
| <a name="module_iam_access_analyzer-eu-west-1"></a> [iam\_access\_analyzer-eu-west-1](#module\_iam\_access\_analyzer-eu-west-1) | ./modules/iam_access_analyzer | n/a |
| <a name="module_iam_access_analyzer-us-east-1"></a> [iam\_access\_analyzer-us-east-1](#module\_iam\_access\_analyzer-us-east-1) | ./modules/iam_access_analyzer | n/a |
| <a name="module_iam_access_analyzer-us-east-2"></a> [iam\_access\_analyzer-us-east-2](#module\_iam\_access\_analyzer-us-east-2) | ./modules/iam_access_analyzer | n/a |
| <a name="module_s3_bucket-eu-west-1"></a> [s3\_bucket-eu-west-1](#module\_s3\_bucket-eu-west-1) | ./modules/s3_bucket | n/a |
| <a name="module_s3_bucket-us-east-1"></a> [s3\_bucket-us-east-1](#module\_s3\_bucket-us-east-1) | ./modules/s3_bucket | n/a |
| <a name="module_s3_bucket-us-east-2"></a> [s3\_bucket-us-east-2](#module\_s3\_bucket-us-east-2) | ./modules/s3_bucket | n/a |
| <a name="module_securityhub_eu-west-1"></a> [securityhub\_eu-west-1](#module\_securityhub\_eu-west-1) | ./modules/securityhub | n/a |
| <a name="module_securityhub_us-east-1"></a> [securityhub\_us-east-1](#module\_securityhub\_us-east-1) | ./modules/securityhub | n/a |
| <a name="module_securityhub_us-east-2"></a> [securityhub\_us-east-2](#module\_securityhub\_us-east-2) | ./modules/securityhub | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_organizations_organization.self](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organization) | resource |
| [aws_organizations_organization.self](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/organizations_organization) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_type"></a> [account\_type](#input\_account\_type) | AWS account type (master, administrator, log, member) | `string` | n/a | yes |
| <a name="input_bucket_custom_policy_json"></a> [bucket\_custom\_policy\_json](#input\_bucket\_custom\_policy\_json) | Custom S3 bucket policy override JSON | `string` | `""` | no |
| <a name="input_cloudtrail_enable_log_file_validation"></a> [cloudtrail\_enable\_log\_file\_validation](#input\_cloudtrail\_enable\_log\_file\_validation) | Specifies whether log file integrity validation is enabled. Creates signed digest for validated contents of logs | `bool` | `true` | no |
| <a name="input_cloudtrail_enable_logging"></a> [cloudtrail\_enable\_logging](#input\_cloudtrail\_enable\_logging) | Enable logging for the trail | `bool` | `true` | no |
| <a name="input_cloudtrail_include_global_service_events"></a> [cloudtrail\_include\_global\_service\_events](#input\_cloudtrail\_include\_global\_service\_events) | Specifies whether the trail is publishing events from global services such as IAM to the log files | `bool` | `true` | no |
| <a name="input_cloudtrail_insight_selector"></a> [cloudtrail\_insight\_selector](#input\_cloudtrail\_insight\_selector) | Specifies an insight selector for identifying unusual operational activity. See: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudtrail#insight_type details for this variable | <pre>list(object({<br>    insight_type = string<br>  }))</pre> | <pre>[<br>  {<br>    "insight_type": "ApiCallRateInsight"<br>  },<br>  {<br>    "insight_type": "ApiErrorRateInsight"<br>  }<br>]</pre> | no |
| <a name="input_cloudtrail_is_multi_region_trail"></a> [cloudtrail\_is\_multi\_region\_trail](#input\_cloudtrail\_is\_multi\_region\_trail) | Specifies whether the trail is created in the current region or in all regions | `bool` | `true` | no |
| <a name="input_cloudtrail_is_organization_trail"></a> [cloudtrail\_is\_organization\_trail](#input\_cloudtrail\_is\_organization\_trail) | The trail is an AWS Organizations trail | `bool` | `true` | no |
| <a name="input_cloudtrail_name"></a> [cloudtrail\_name](#input\_cloudtrail\_name) | CloudTrail trail name | `string` | `"org"` | no |
| <a name="input_cloudtrail_s3_bucket"></a> [cloudtrail\_s3\_bucket](#input\_cloudtrail\_s3\_bucket) | CloudTrail S3 bucket | `string` | `null` | no |
| <a name="input_cloudtrail_s3_key_prefix"></a> [cloudtrail\_s3\_key\_prefix](#input\_cloudtrail\_s3\_key\_prefix) | S3 key prefix for CloudTrail | `string` | `"cloudtrail"` | no |
| <a name="input_config_s3_bucket_key_prefix"></a> [config\_s3\_bucket\_key\_prefix](#input\_config\_s3\_bucket\_key\_prefix) | S3 key prefix for Config | `string` | `"config"` | no |
| <a name="input_ecr_scan_type"></a> [ecr\_scan\_type](#input\_ecr\_scan\_type) | ECR scanning type (BASIC or ENHANCED) | `string` | `"BASIC"` | no |
| <a name="input_ecr_scanning_rules"></a> [ecr\_scanning\_rules](#input\_ecr\_scanning\_rules) | List of ECR scanning rules | `list(map(string))` | <pre>[<br>  {<br>    "filter": "*",<br>    "frequency": "SCAN_ON_PUSH"<br>  }<br>]</pre> | no |
| <a name="input_enable_cloudtrail"></a> [enable\_cloudtrail](#input\_enable\_cloudtrail) | Enable AWS CloudTrail service | `bool` | `true` | no |
| <a name="input_enable_config"></a> [enable\_config](#input\_enable\_config) | Enable AWS Config service | `bool` | `true` | no |
| <a name="input_enable_ebs_baseline"></a> [enable\_ebs\_baseline](#input\_enable\_ebs\_baseline) | Boolean whether iam-baseline is enabled. | `bool` | `true` | no |
| <a name="input_enable_ecr_baseline"></a> [enable\_ecr\_baseline](#input\_enable\_ecr\_baseline) | Enable ECR image scanning | `bool` | `true` | no |
| <a name="input_enable_firewall_manager"></a> [enable\_firewall\_manager](#input\_enable\_firewall\_manager) | Enable AWS Firewall Manager service | `bool` | `true` | no |
| <a name="input_enable_guardduty"></a> [enable\_guardduty](#input\_enable\_guardduty) | Enable AWS GuardDuty service | `bool` | `true` | no |
| <a name="input_enable_iam_access_analyzer"></a> [enable\_iam\_access\_analyzer](#input\_enable\_iam\_access\_analyzer) | Enable AWS IAM Access Analyzer | `bool` | `true` | no |
| <a name="input_enable_iam_baseline"></a> [enable\_iam\_baseline](#input\_enable\_iam\_baseline) | Boolean whether iam-baseline is enabled. | `bool` | `true` | no |
| <a name="input_enable_s3_baseline"></a> [enable\_s3\_baseline](#input\_enable\_s3\_baseline) | Enable S3 baseline? | `bool` | `true` | no |
| <a name="input_enable_s3_buckets"></a> [enable\_s3\_buckets](#input\_enable\_s3\_buckets) | Enable S3 buckets? | `bool` | `false` | no |
| <a name="input_enable_securityhub"></a> [enable\_securityhub](#input\_enable\_securityhub) | Enable AWS Security Hub service | `bool` | `true` | no |
| <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy) | Allow destroy of S3 bucket with objects | `bool` | `false` | no |
| <a name="input_iam_allow_users_to_change_password"></a> [iam\_allow\_users\_to\_change\_password](#input\_iam\_allow\_users\_to\_change\_password) | Whether to allow users to change their own password. | `bool` | `true` | no |
| <a name="input_iam_create_password_policy"></a> [iam\_create\_password\_policy](#input\_iam\_create\_password\_policy) | Define if the password policy should be created. | `bool` | `true` | no |
| <a name="input_iam_max_password_age"></a> [iam\_max\_password\_age](#input\_iam\_max\_password\_age) | The number of days that an user password is valid. | `number` | `0` | no |
| <a name="input_iam_minimum_password_length"></a> [iam\_minimum\_password\_length](#input\_iam\_minimum\_password\_length) | Minimum length to require for user passwords. | `number` | `14` | no |
| <a name="input_iam_password_reuse_prevention"></a> [iam\_password\_reuse\_prevention](#input\_iam\_password\_reuse\_prevention) | The number of previous passwords that users are prevented from reusing. | `number` | `24` | no |
| <a name="input_iam_require_lowercase_characters"></a> [iam\_require\_lowercase\_characters](#input\_iam\_require\_lowercase\_characters) | Whether to require lowercase characters for user passwords. | `bool` | `true` | no |
| <a name="input_iam_require_numbers"></a> [iam\_require\_numbers](#input\_iam\_require\_numbers) | Whether to require numbers for user passwords. | `bool` | `true` | no |
| <a name="input_iam_require_symbols"></a> [iam\_require\_symbols](#input\_iam\_require\_symbols) | Whether to require symbols for user passwords. | `bool` | `true` | no |
| <a name="input_iam_require_uppercase_characters"></a> [iam\_require\_uppercase\_characters](#input\_iam\_require\_uppercase\_characters) | Whether to require uppercase characters for user passwords. | `bool` | `true` | no |
| <a name="input_s3_block_public_acls"></a> [s3\_block\_public\_acls](#input\_s3\_block\_public\_acls) | Whether Amazon S3 should block public ACLs for buckets in this account. Defaults to true. | `bool` | `true` | no |
| <a name="input_s3_block_public_policy"></a> [s3\_block\_public\_policy](#input\_s3\_block\_public\_policy) | Whether Amazon S3 should block public bucket policies for buckets in this account. Defaults to true. | `bool` | `true` | no |
| <a name="input_s3_ignore_public_acls"></a> [s3\_ignore\_public\_acls](#input\_s3\_ignore\_public\_acls) | Whether Amazon S3 should ignore public ACLs for buckets in this account. Defaults to true. | `bool` | `true` | no |
| <a name="input_s3_restrict_public_buckets"></a> [s3\_restrict\_public\_buckets](#input\_s3\_restrict\_public\_buckets) | Whether Amazon S3 should restrict public bucket policies for buckets in this account. Defaults to true. | `bool` | `true` | no |
| <a name="input_security_administrator_account_id"></a> [security\_administrator\_account\_id](#input\_security\_administrator\_account\_id) | AWS Security Administrator Account ID | `number` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Specifies object tags key and value. This applies to all resources created by this module. | `map(any)` | <pre>{<br>  "Environment": "infra",<br>  "Product": "security",<br>  "Team": "devops",<br>  "Terraform": true<br>}</pre> | no |
| <a name="input_target_regions"></a> [target\_regions](#input\_target\_regions) | A list of regions to set up with this module. | `list(string)` | <pre>[<br>  "eu-west-1",<br>  "us-east-1",<br>  "us-east-2"<br>]</pre> | no |
| <a name="input_vpc_flow_logs_s3_key_prefix"></a> [vpc\_flow\_logs\_s3\_key\_prefix](#input\_vpc\_flow\_logs\_s3\_key\_prefix) | S3 key prefix for VPC Flow Logs | `string` | `"flow-logs"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_s3_bucket_arns"></a> [s3\_bucket\_arns](#output\_s3\_bucket\_arns) | S3 Bucket ARNs |
| <a name="output_s3_bucket_names"></a> [s3\_bucket\_names](#output\_s3\_bucket\_names) | S3 Bucket Names |
| <a name="output_s3_bucket_region_arn_map"></a> [s3\_bucket\_region\_arn\_map](#output\_s3\_bucket\_region\_arn\_map) | Map of regions and S3 ARNs |
| <a name="output_s3_bucket_region_name_map"></a> [s3\_bucket\_region\_name\_map](#output\_s3\_bucket\_region\_name\_map) | Map of regions and S3 names |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
