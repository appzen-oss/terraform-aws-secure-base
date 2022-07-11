# AWS Security Hub

## Features

- Enable Security Hub
- Delegate management to administrator account
- Subscribe to standards
- Subscribe to 3rd party products (optional)

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
| [aws_securityhub_account.self](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/securityhub_account) | resource |
| [aws_securityhub_organization_admin_account.self](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/securityhub_organization_admin_account) | resource |
| [aws_securityhub_organization_configuration.self](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/securityhub_organization_configuration) | resource |
| [aws_securityhub_product_subscription.self](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/securityhub_product_subscription) | resource |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_type"></a> [account\_type](#input\_account\_type) | AWS account type (master, administrator, log, member) | `string` | n/a | yes |
| <a name="input_enable"></a> [enable](#input\_enable) | Enable AWS GuardDuty and delegate administrator | `bool` | `true` | no |
| <a name="input_enable_products"></a> [enable\_products](#input\_enable\_products) | Subscribe Security Hub to Products | `list(string)` | `[]` | no |
| <a name="input_product_arns"></a> [product\_arns](#input\_product\_arns) | Security Hub product integrations | `map(any)` | <pre>{<br>  "3coresec/3coresec": ":product/3coresec/3coresec",<br>  "alertlogic/althreatmanagement": "733251395267:product/alertlogic/althreatmanagement",<br>  "amazon/detective": ":product/amazon/detective",<br>  "aqua-security/kube-bench": ":product/aqua-security/kube-bench",<br>  "aquasecurity/aquasecurity": ":product/aquasecurity/aquasecurity",<br>  "armordefense/armoranywhere": "679703615338:product/armordefense/armoranywhere",<br>  "atlassian/jira-service-management": ":product/atlassian/jira-service-management",<br>  "atlassian/opsgenie": ":product/atlassian/opsgenie",<br>  "attackiq/attackiq-platform": ":product/attackiq/attackiq-platform",<br>  "aws/access-analyzer": ":product/aws/access-analyzer",<br>  "aws/audit-manager": ":product/aws/audit-manager",<br>  "aws/chatbot": ":product/aws/chatbot",<br>  "aws/config": ":product/aws/config",<br>  "aws/firewall-manager": ":product/aws/firewall-manager",<br>  "aws/guardduty": ":product/aws/guardduty",<br>  "aws/health": ":product/aws/health",<br>  "aws/inspector": ":product/aws/inspector",<br>  "aws/macie": ":product/aws/macie",<br>  "aws/ssm-patch-manager": ":product/aws/ssm-patch-manager",<br>  "aws/systems-manager-opscenter-and-explorer": ":product/aws/systems-manager-opscenter-and-explorer",<br>  "aws/trusted-advisor": ":product/aws/trusted-advisor",<br>  "barracuda/cloudsecurityguardian": "151784055945:product/barracuda/cloudsecurityguardian",<br>  "bigid/bigid-enterprise": ":product/bigid/bigid-enterprise",<br>  "blue-hexagon/blue-hexagon-for-aws": ":product/blue-hexagon/blue-hexagon-for-aws",<br>  "capitis/c2vs": ":product/capitis/c2vs",<br>  "caveonix/caveonix-cloud": ":product/caveonix/caveonix-cloud",<br>  "checkpoint/cloudguard-iaas": "758245563457:product/checkpoint/cloudguard-iaas",<br>  "checkpoint/dome9-arc": "634729597623:product/checkpoint/dome9-arc",<br>  "cloud-custodian/cloud-custodian": ":product/cloud-custodian/cloud-custodian",<br>  "cloud-storage-security/antivirus-for-amazon-s3": ":product/cloud-storage-security/antivirus-for-amazon-s3",<br>  "cloudtamerio/cloudtamerio": ":product/cloudtamerio/cloudtamerio",<br>  "crowdstrike/crowdstrike-falcon": "517716713836:product/crowdstrike/crowdstrike-falcon",<br>  "cyberark/cyberark-pta": "749430749651:product/cyberark/cyberark-pta",<br>  "data-theorem/api-cloud-web-secure": ":product/data-theorem/api-cloud-web-secure",<br>  "disruptops-inc/disruptops": ":product/disruptops-inc/disruptops",<br>  "fireeye/fireeye-helix": "264756907367:product/fireeye/fireeye-helix",<br>  "forcepoint/forcepoint-casb": "365761988620:product/forcepoint/forcepoint-casb",<br>  "forcepoint/forcepoint-cloud-security-gateway": ":product/forcepoint/forcepoint-cloud-security-gateway",<br>  "forcepoint/forcepoint-dlp": "365761988620:product/forcepoint/forcepoint-dlp",<br>  "forcepoint/forcepoint-ngfw": "365761988620:product/forcepoint/forcepoint-ngfw",<br>  "fugue/fugue": ":product/fugue/fugue",<br>  "guardicore/aws-infection-monkey": "324264561773:product/guardicore/aws-infection-monkey",<br>  "guardicore/centra": "324264561773:product/guardicore/centra",<br>  "hackerone/vulnerability-intelligence": ":product/hackerone/vulnerability-intelligence",<br>  "ibm/qradar-siem": "949680696695:product/ibm/qradar-siem",<br>  "juniper-networks/vsrx-next-generation-firewall": ":product/juniper-networks/vsrx-next-generation-firewall",<br>  "k9-security/access-analyzer": ":product/k9-security/access-analyzer",<br>  "lacework/lacework": ":product/lacework/lacework",<br>  "logz-io/cloud-siem": ":product/logz-io/cloud-siem",<br>  "mcafee-skyhigh/mcafee-mvision-cloud-aws": "297986523463:product/mcafee-skyhigh/mcafee-mvision-cloud-aws",<br>  "micro-focus/arcsight": ":product/micro-focus/arcsight",<br>  "netscout/netscout-cyber-investigator": ":product/netscout/netscout-cyber-investigator",<br>  "pagerduty/pagerduty": ":product/pagerduty/pagerduty",<br>  "paloaltonetworks/demisto": ":product/paloaltonetworks/demisto",<br>  "paloaltonetworks/paloalto-networks-vmseries": ":product/paloaltonetworks/paloalto-networks-vmseries",<br>  "paloaltonetworks/redlock": "188619942792:product/paloaltonetworks/redlock",<br>  "prowler/prowler": ":product/prowler/prowler",<br>  "qualys/qualys-vm": "805950163170:product/qualys/qualys-vm",<br>  "rackspace/cloud-native-security": "530014582677:product/rackspace/cloud-native-security",<br>  "rapid7/insight-connect": ":product/rapid7/insight-connect",<br>  "rapid7/insightvm": "336818582268:product/rapid7/insightvm",<br>  "rsa/archer": ":product/rsa/archer",<br>  "secureclouddb/secureclouddb": ":product/secureclouddb/secureclouddb",<br>  "sentinelone/endpoint-protection": ":product/sentinelone/endpoint-protection",<br>  "servicenow/itsm": "842447150064:product/servicenow/itsm",<br>  "slack/slack": "429538831549:product/slack/slack",<br>  "sonrai-security/sonrai-dig": ":product/sonrai-security/sonrai-dig",<br>  "sophos/sophos-server-protection": "062897671886:product/sophos/sophos-server-protection",<br>  "splunk/phantom": ":product/splunk/phantom",<br>  "splunk/splunk-enterprise": "112543817624:product/splunk/splunk-enterprise",<br>  "stackrox/kubernetes-security": ":product/stackrox/kubernetes-security",<br>  "sumologicinc/sumologic-mda": "956882708938:product/sumologicinc/sumologic-mda",<br>  "symantec-corp/symantec-cwp": "754237914691:product/symantec-corp/symantec-cwp",<br>  "sysdig/sysdig-secure-for-cloud": ":product/sysdig/sysdig-secure-for-cloud",<br>  "tenable/tenable-io": "422820575223:product/tenable/tenable-io",<br>  "threatmodeler-software/threatmodeler": ":product/threatmodeler-software/threatmodeler",<br>  "turbot/turbot": "453761072151:product/turbot/turbot",<br>  "twistlock/twistlock-enterprise": "496947949261:product/twistlock/twistlock-enterprise",<br>  "vectra-ai/cognito-detect": "978576646331:product/vectra-ai/cognito-detect"<br>}</pre> | no |
| <a name="input_security_administrator_account_id"></a> [security\_administrator\_account\_id](#input\_security\_administrator\_account\_id) | AWS Security Administrator Account ID | `number` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
