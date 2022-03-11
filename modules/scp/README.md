# scp_policies

## Features

- Install SCP policies

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.4 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_organizations_policy.deny_cloudtrail_disable](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_policy) | resource |
| [aws_organizations_policy.deny_cloudtrail_tamper](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_policy) | resource |
| [aws_organizations_policy.deny_config_modify](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_policy) | resource |
| [aws_organizations_policy.deny_ecr_create_write](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_policy) | resource |
| [aws_organizations_policy.deny_guardduty_modify](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_policy) | resource |
| [aws_organizations_policy.deny_member_leaving](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_policy) | resource |
| [aws_organizations_policy.deny_s3_public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_policy) | resource |
| [aws_organizations_policy.require_s3_encryption](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_type"></a> [account\_type](#input\_account\_type) | AWS account type (master, administrator, log, member) | `string` | n/a | yes |
| <a name="input_enable"></a> [enable](#input\_enable) | Enable managing SCP policies | `bool` | `true` | no |
| <a name="input_enable_cloudtrail"></a> [enable\_cloudtrail](#input\_enable\_cloudtrail) | Manage AWS CloudTrail SCP policies | `bool` | `true` | no |
| <a name="input_enable_config"></a> [enable\_config](#input\_enable\_config) | Manage AWS Config  SCP policies | `bool` | `true` | no |
| <a name="input_enable_ebs"></a> [enable\_ebs](#input\_enable\_ebs) | Manage EBS SCP policies | `bool` | `true` | no |
| <a name="input_enable_ecr"></a> [enable\_ecr](#input\_enable\_ecr) | Manage ECR SCP policies | `bool` | `true` | no |
| <a name="input_enable_guardduty"></a> [enable\_guardduty](#input\_enable\_guardduty) | Manage AWS GuardDuty SCP policies | `bool` | `true` | no |
| <a name="input_enable_iam"></a> [enable\_iam](#input\_enable\_iam) | Manage IAM SCP policies | `bool` | `true` | no |
| <a name="input_enable_s3"></a> [enable\_s3](#input\_enable\_s3) | Manage S3 SCP policies | `bool` | `true` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Specifies object tags key and value. This applies to all resources created by this module. | `map(any)` | <pre>{<br>  "Environment": "infra",<br>  "Product": "security",<br>  "Team": "devops",<br>  "Terraform": true<br>}</pre> | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
