# AWS GuardDuty

## Features

- Enable GuardDuty

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
| [aws_guardduty_detector.self](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/guardduty_detector) | resource |
| [aws_guardduty_organization_admin_account.self](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/guardduty_organization_admin_account) | resource |
| [aws_guardduty_organization_configuration.self](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/guardduty_organization_configuration) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_type"></a> [account\_type](#input\_account\_type) | AWS account type (master, administrator, member) | `string` | n/a | yes |
| <a name="input_enable"></a> [enable](#input\_enable) | Enable AWS GuardDuty and delegate administrator | `bool` | `true` | no |
| <a name="input_finding_publishing_frequency"></a> [finding\_publishing\_frequency](#input\_finding\_publishing\_frequency) | Frequency of notifications sent for findings (FIFTEEN\_MINUTES, ONE\_HOUR, SIX\_HOURS) | `string` | `"FIFTEEN_MINUTES"` | no |
| <a name="input_security_administrator_account_id"></a> [security\_administrator\_account\_id](#input\_security\_administrator\_account\_id) | AWS Security Administrator Account ID | `number` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Specifies object tags key and value. This applies to all resources created by this module. | `map(any)` | <pre>{<br>  "Environment": "infra",<br>  "Product": "security",<br>  "Terraform": true<br>}</pre> | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
