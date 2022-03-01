# AWS Config

## Features

- Enable AWS Config

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.4 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.2.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_config_configuration_aggregator.organization](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_configuration_aggregator) | resource |
| [aws_config_configuration_recorder.recorder](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_configuration_recorder) | resource |
| [aws_config_configuration_recorder_status.recorder](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_configuration_recorder_status) | resource |
| [aws_config_delivery_channel.bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_delivery_channel) | resource |
| [aws_iam_role.organization](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.organization](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_organizations_delegated_administrator.config](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_delegated_administrator) | resource |
| [aws_sns_topic.config](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic) | resource |
| [aws_sns_topic_policy.config](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_policy) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.config-sns-policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_type"></a> [account\_type](#input\_account\_type) | AWS account type (master, administrator, member) | `string` | n/a | yes |
| <a name="input_delivery_channel_name"></a> [delivery\_channel\_name](#input\_delivery\_channel\_name) | n/a | `string` | n/a | yes |
| <a name="input_delivery_frequency"></a> [delivery\_frequency](#input\_delivery\_frequency) | n/a | `string` | `""` | no |
| <a name="input_enable"></a> [enable](#input\_enable) | Enable AWS Config and delegate administrator | `bool` | `true` | no |
| <a name="input_iam_role_arn"></a> [iam\_role\_arn](#input\_iam\_role\_arn) | n/a | `string` | `""` | no |
| <a name="input_include_global_resource_types"></a> [include\_global\_resource\_types](#input\_include\_global\_resource\_types) | n/a | `string` | `""` | no |
| <a name="input_primary_region"></a> [primary\_region](#input\_primary\_region) | n/a | `string` | `""` | no |
| <a name="input_recorder_name"></a> [recorder\_name](#input\_recorder\_name) | n/a | `string` | n/a | yes |
| <a name="input_s3_bucket_name"></a> [s3\_bucket\_name](#input\_s3\_bucket\_name) | n/a | `string` | `""` | no |
| <a name="input_s3_key_prefix"></a> [s3\_key\_prefix](#input\_s3\_key\_prefix) | n/a | `string` | `""` | no |
| <a name="input_security_administrator_account_id"></a> [security\_administrator\_account\_id](#input\_security\_administrator\_account\_id) | AWS Security Administrator Account ID | `number` | n/a | yes |
| <a name="input_sns_topic_kms_master_key_id"></a> [sns\_topic\_kms\_master\_key\_id](#input\_sns\_topic\_kms\_master\_key\_id) | n/a | `string` | `""` | no |
| <a name="input_sns_topic_name"></a> [sns\_topic\_name](#input\_sns\_topic\_name) | n/a | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Specifies object tags key and value. This applies to all resources created by this module. | `map(any)` | <pre>{<br>  "Environment": "infra",<br>  "Product": "security",<br>  "Terraform": true<br>}</pre> | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
