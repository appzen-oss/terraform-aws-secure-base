# terraform-aws-secure-base

[Terraform Module Registry](https://registry.terraform.io/modules/appzen-oss/secure-base/aws)

A terraform module to set up an AWS multi-account, multi-region organization
with account/region security setting and security services.

## Features

## Usage


## Submodules

This module is composed of several submodules and each of which can be used independently.

- [submodules](./modules/)

## Examples

- [examples](./examples)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.1.4 |
| aws | >= 4.1.0 |
| time | >= 0.7.2 |

## Providers

| Name | Version |
|------|---------|
| aws | 4.2.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| baseline\_ebs\_eu-west-1 | ./modules/baseline_ebs | n/a |
| baseline\_ebs\_us-east-1 | ./modules/baseline_ebs | n/a |
| baseline\_ebs\_us-east-2 | ./modules/baseline_ebs | n/a |
| baseline\_ecr\_eu-west-1 | ./modules/baseline_ecr | n/a |
| baseline\_ecr\_us-east-1 | ./modules/baseline_ecr | n/a |
| baseline\_ecr\_us-east-2 | ./modules/baseline_ecr | n/a |
| baseline\_iam | ./modules/baseline_iam | n/a |
| baseline\_s3 | ./modules/baseline_s3 | n/a |
| firewall\_manager\_us-east-1 | ./modules/firewall_manager | n/a |
| guardduty-eu-west-1 | ./modules/guardduty | n/a |
| guardduty-us-east-1 | ./modules/guardduty | n/a |
| guardduty-us-east-2 | ./modules/guardduty | n/a |
| iam\_access\_analyzer-eu-west-1 | ./modules/iam_access_analyzer | n/a |
| iam\_access\_analyzer-us-east-1 | ./modules/iam_access_analyzer | n/a |
| iam\_access\_analyzer-us-east-2 | ./modules/iam_access_analyzer | n/a |
| s3\_bucket-us-east-1 | ./modules/s3_bucket | n/a |
| securityhub\_eu-west-1 | ./modules/securityhub | n/a |
| securityhub\_us-east-1 | ./modules/securityhub | n/a |
| securityhub\_us-east-2 | ./modules/securityhub | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_organizations_organization.self](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organization) | resource |
| [aws_organizations_organization.self](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/organizations_organization) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| account\_type | AWS account type (master, administrator, member) | `string` | n/a | yes |
| aws\_profile | AWS credential profile | `string` | n/a | yes |
| aws\_region | The AWS region in which global resources are set up. | `string` | `"us-east-1"` | no |
| bucket\_custom\_policy\_json | Custom S3 bucket policy override JSON | `string` | `""` | no |
| cloudtrail\_s3\_key\_prefix | S3 key prefix for CloudTrail | `string` | `"cloudtrail"` | no |
| config\_s3\_bucket\_key\_prefix | S3 key prefix for Config | `string` | `"config"` | no |
| ecr\_scan\_type | ECR scanning type (BASIC or ENHANCED) | `string` | `"BASIC"` | no |
| ecr\_scanning\_rules | List of ECR scanning rules | `list(map(string))` | ```[ { "filter": "*", "frequency": "SCAN_ON_PUSH" } ]``` | no |
| enable\_cloudtrail | Enable AWS CloudTrail service | `bool` | `true` | no |
| enable\_config | Enable AWS Config service | `bool` | `true` | no |
| enable\_ebs\_baseline | Boolean whether iam-baseline is enabled. | `bool` | `true` | no |
| enable\_ecr\_baseline | Enable ECR image scanning | `bool` | `true` | no |
| enable\_firewall\_manager | Enable AWS Firewall Manager service | `bool` | `true` | no |
| enable\_guardduty | Enable AWS GuardDuty service | `bool` | `true` | no |
| enable\_iam\_access\_analyzer | Enable AWS IAM Access Analyzer | `bool` | `true` | no |
| enable\_iam\_baseline | Boolean whether iam-baseline is enabled. | `bool` | `true` | no |
| enable\_s3\_baseline | Enable S3 baseline? | `bool` | `true` | no |
| enable\_s3\_buckets | Enable S3 buckets? | `bool` | `false` | no |
| enable\_securityhub | Enable AWS Security Hub service | `bool` | `true` | no |
| force\_destroy | Allow destroy of S3 bucket with objects | `bool` | `false` | no |
| iam\_allow\_users\_to\_change\_password | Whether to allow users to change their own password. | `bool` | `true` | no |
| iam\_create\_password\_policy | Define if the password policy should be created. | `bool` | `true` | no |
| iam\_max\_password\_age | The number of days that an user password is valid. | `number` | `0` | no |
| iam\_minimum\_password\_length | Minimum length to require for user passwords. | `number` | `14` | no |
| iam\_password\_reuse\_prevention | The number of previous passwords that users are prevented from reusing. | `number` | `24` | no |
| iam\_require\_lowercase\_characters | Whether to require lowercase characters for user passwords. | `bool` | `true` | no |
| iam\_require\_numbers | Whether to require numbers for user passwords. | `bool` | `true` | no |
| iam\_require\_symbols | Whether to require symbols for user passwords. | `bool` | `true` | no |
| iam\_require\_uppercase\_characters | Whether to require uppercase characters for user passwords. | `bool` | `true` | no |
| s3\_block\_public\_acls | Whether Amazon S3 should block public ACLs for buckets in this account. Defaults to true. | `bool` | `true` | no |
| s3\_block\_public\_policy | Whether Amazon S3 should block public bucket policies for buckets in this account. Defaults to true. | `bool` | `true` | no |
| s3\_ignore\_public\_acls | Whether Amazon S3 should ignore public ACLs for buckets in this account. Defaults to true. | `bool` | `true` | no |
| s3\_restrict\_public\_buckets | Whether Amazon S3 should restrict public bucket policies for buckets in this account. Defaults to true. | `bool` | `true` | no |
| security\_administrator\_account\_id | AWS Security Administrator Account ID | `number` | n/a | yes |
| tags | Specifies object tags key and value. This applies to all resources created by this module. | `map` | ```{ "Environment": "infra", "Product": "security", "Team": "devops", "Terraform": true }``` | no |
| target\_regions | A list of regions to set up with this module. | `list` | ```[ "eu-west-1", "us-east-1", "us-east-2" ]``` | no |
| vpc\_flow\_logs\_s3\_key\_prefix | S3 key prefix for VPC Flow Logs | `string` | `"flow-logs"` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
