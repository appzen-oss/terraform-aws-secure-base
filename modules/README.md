
All modules are designed to work in a multi-account organization and to delegate administration to an admnistrator account (if supported by AWS)

AWS resources that have account or regional security settings

| Resource/Service | Supported | Setting |
| :--------------- | :--: | :---- |
| cloudtrail       |      | setup |
| ebs              | yes  | encryption |
| ecr              | yes  | scanning |
| iam              | yes  | password policy |
| s3               | yes  | public access |

AWS services required by Security Hub

| Resource/Service | Supported | Setting |
| :--------------- | :--: | :---- |
| config           | | setup |

AWS services that integrate with Security Hub

| Service           | Supported |
| :---------------- | :-------: |
| access-analyzer   | yes |
| audit-manager     | |
| chatbot           | |
| detective         | |
| firewall-manager  | yes |
| guardduty         | yes |
| health            | |
| inspector         | |
| macie             | |
| ssm-patch-manager | |
| systems-manager-opscenter-and-explorer | |
| trusted-advisor   | |
