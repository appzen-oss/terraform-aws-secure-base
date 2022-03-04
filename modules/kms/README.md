# AWS KMS Key

## Features

- Create KMS key
- Create regional KMS replica key

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.4 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.3.0 |
| <a name="provider_aws.primary_kms_key"></a> [aws.primary\_kms\_key](#provider\_aws.primary\_kms\_key) | 4.3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_kms_alias.replica](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias) | resource |
| [aws_kms_alias.self](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias) | resource |
| [aws_kms_key.self](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_kms_replica_key.self](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_replica_key) | resource |
| [aws_kms_key.primary](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/kms_key) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alias"></a> [alias](#input\_alias) | The display name of the alias. The name must start with the word `alias` followed by a forward slash. If not specified, the alias name will be auto-generated. | `string` | `""` | no |
| <a name="input_customer_master_key_spec"></a> [customer\_master\_key\_spec](#input\_customer\_master\_key\_spec) | Specifies whether the key contains a symmetric key or an asymmetric key pair and the encryption algorithms or signing algorithms that the key supports. Valid values: `SYMMETRIC_DEFAULT`, `RSA_2048`, `RSA_3072`, `RSA_4096`, `ECC_NIST_P256`, `ECC_NIST_P384`, `ECC_NIST_P521`, or `ECC_SECG_P256K1`. | `string` | `"SYMMETRIC_DEFAULT"` | no |
| <a name="input_deletion_window_in_days"></a> [deletion\_window\_in\_days](#input\_deletion\_window\_in\_days) | Duration in days after which the key is deleted after destruction of the resource | `number` | `30` | no |
| <a name="input_description"></a> [description](#input\_description) | The description of the key as viewed in AWS console | `string` | `"KMS master key"` | no |
| <a name="input_enable"></a> [enable](#input\_enable) | Manage KMS key? | `bool` | `true` | no |
| <a name="input_enable_key_rotation"></a> [enable\_key\_rotation](#input\_enable\_key\_rotation) | Specifies whether key rotation is enabled | `bool` | `true` | no |
| <a name="input_key_usage"></a> [key\_usage](#input\_key\_usage) | Specifies the intended use of the key. Valid values: `ENCRYPT_DECRYPT` or `SIGN_VERIFY`. | `string` | `"ENCRYPT_DECRYPT"` | no |
| <a name="input_multi_region"></a> [multi\_region](#input\_multi\_region) | Indicates whether the KMS key is a multi-Region (true) or regional (false) key. | `bool` | `false` | no |
| <a name="input_policy"></a> [policy](#input\_policy) | A valid KMS policy JSON document. Note that if the policy document is not specific enough (but still valid), Terraform may view the policy as constantly changing in a terraform plan. In this case, please make sure you use the verbose/specific version of the policy. | `string` | `" "` | no |
| <a name="input_replica"></a> [replica](#input\_replica) | Manage KMS replica key? | `bool` | `false` | no |
| <a name="input_replica_deletion_window_in_days"></a> [replica\_deletion\_window\_in\_days](#input\_replica\_deletion\_window\_in\_days) | Duration in days after which the replica key is deleted after destruction of the resource | `number` | `30` | no |
| <a name="input_replica_description"></a> [replica\_description](#input\_replica\_description) | The description of the key as viewed in AWS console | `string` | `"Multi-Region replica KMS key"` | no |
| <a name="input_replica_policy"></a> [replica\_policy](#input\_replica\_policy) | Replica KMS key policy JSON document. | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Specifies object tags key and value. This applies to all resources created by this module. | `map(any)` | <pre>{<br>  "Environment": "infra",<br>  "Product": "security",<br>  "Team": "devops",<br>  "Terraform": true<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alias_arn"></a> [alias\_arn](#output\_alias\_arn) | KMS Alias ARN |
| <a name="output_alias_target_key_arn"></a> [alias\_target\_key\_arn](#output\_alias\_target\_key\_arn) | KMS Alias target key ARN |
| <a name="output_key_rotation"></a> [key\_rotation](#output\_key\_rotation) | Key rotation enabled? |
| <a name="output_multi_region_configuration"></a> [multi\_region\_configuration](#output\_multi\_region\_configuration) | Mulit-region KMS key configuration |
| <a name="output_primary_key_arn"></a> [primary\_key\_arn](#output\_primary\_key\_arn) | Primary KMS key ARN |
| <a name="output_primary_key_id"></a> [primary\_key\_id](#output\_primary\_key\_id) | Primary KMS key ID |
| <a name="output_replica_alias_arn"></a> [replica\_alias\_arn](#output\_replica\_alias\_arn) | Replica KMS key alias |
| <a name="output_replica_alias_target_key_arn"></a> [replica\_alias\_target\_key\_arn](#output\_replica\_alias\_target\_key\_arn) | Replica KMS key alias |
| <a name="output_replica_key_arn"></a> [replica\_key\_arn](#output\_replica\_key\_arn) | Replica KMS key ARN |
| <a name="output_replica_key_id"></a> [replica\_key\_id](#output\_replica\_key\_id) | Replica KMS key ID |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
