# submodules

All modules are designed to work in a multi-account organization and to delegate administration to an administrator account (if supported by AWS)

## AWS resources that have account or regional security settings

| Resource/Service | Supported | Setting |
| :--------------- | :--: | :---- |
| [cloudtrail](./cloudtrail) |      | setup |
| [ebs](./baseline_ebs)      | yes  | encryption |
| [ecr](./baseline_ecr)      | yes  | scanning |
| [iam](./baseline_iam)      | yes  | password policy |
| [s3](./baseline_s3)        | yes  | public access |

## AWS services required by [Security Hub](./securityhub)

| Resource/Service | Supported | Setting |
| :--------------- | :--: | :---- |
| [config](./config)        | | setup |
| [s3 buckets](./s3_bucket) | | |

## AWS services that integrate with [Security Hub](./securityhub)

| Service           | Supported |
| :---------------- | :-------: |
| [access-analyzer](./iam_access_analyzer) | yes |
| audit-manager                           | |
| chatbot                                 | |
| [detective](./detective)                | |
| [firewall-manager](./firewall_manager)  | yes |
| [guardduty](./guardduty)                | yes |
| [health](./health)                      | |
| [inspector](./inspector)                | |
| [macie](/.macie)                        | |
| ssm-patch-manager                       | |
| systems-manager-opscenter-and-explorer  | |
| trusted-advisor                         | |
