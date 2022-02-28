# Security baseline for ECR

## Features

- Configure ECR image scanning rules

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
| [aws_ecr_registry_scanning_configuration.self](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_registry_scanning_configuration) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enable"></a> [enable](#input\_enable) | Enable ECR scanning | `bool` | `true` | no |
| <a name="input_rules"></a> [rules](#input\_rules) | List of ECR scanning rules | `list(map(string))` | <pre>[<br>  {<br>    "filter": "*",<br>    "frequency": "SCAN_ON_PUSH"<br>  }<br>]</pre> | no |
| <a name="input_scan_type"></a> [scan\_type](#input\_scan\_type) | ECR scanning type (BASIC or ENHANCED) | `string` | `"BASIC"` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
