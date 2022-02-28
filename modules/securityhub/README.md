# AWS Security Hub

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

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_type"></a> [account\_type](#input\_account\_type) | AWS account type (master, administrator, member) | `string` | n/a | yes |
| <a name="input_enable"></a> [enable](#input\_enable) | Enable AWS GuardDuty and delegate administrator | `bool` | `true` | no |
| <a name="input_product_arns"></a> [product\_arns](#input\_product\_arns) | Security Hub product integrations | `map(any)` | <pre>{<br>  "3coresec": ":product/3coresec/3coresec",<br>  "access-analyzer": ":product/aws/access-analyzer",<br>  "althreatmanagement": "733251395267:product/alertlogic/althreatmanagement",<br>  "antivirus-for-amazon-s3": ":product/cloud-storage-security/antivirus-for-amazon-s3",<br>  "aquasecurity": ":product/aquasecurity/aquasecurity",<br>  "archer": ":product/rsa/archer",<br>  "arcsight": ":product/micro-focus/arcsight",<br>  "armoranywhere": "679703615338:product/armordefense/armoranywhere",<br>  "attackiq-platform": ":product/attackiq/attackiq-platform",<br>  "audit-manager": ":product/aws/audit-manager",<br>  "aws-infection-monkey": "324264561773:product/guardicore/aws-infection-monkey",<br>  "bigid-enterprise": ":product/bigid/bigid-enterprise",<br>  "blue-hexagon-for-aws": ":product/blue-hexagon/blue-hexagon-for-aws",<br>  "c2vs": ":product/capitis/c2vs",<br>  "caveonix-cloud": ":product/caveonix/caveonix-cloud",<br>  "centra": "324264561773:product/guardicore/centra",<br>  "chatbot": ":product/aws/chatbot",<br>  "cloud-custodian": ":product/cloud-custodian/cloud-custodian",<br>  "cloud-native-security": "530014582677:product/rackspace/cloud-native-security",<br>  "cloud-siem": ":product/logz-io/cloud-siem",<br>  "cloudguard-iaas": "758245563457:product/checkpoint/cloudguard-iaas",<br>  "cloudsecurityguardian": "151784055945:product/barracuda/cloudsecurityguardian",<br>  "cloudtamerio": ":product/cloudtamerio/cloudtamerio",<br>  "cognito-detect": "978576646331:product/vectra-ai/cognito-detect",<br>  "crowdstrike-falcon": "517716713836:product/crowdstrike/crowdstrike-falcon",<br>  "cyberark-pta": "749430749651:product/cyberark/cyberark-pta",<br>  "demisto": ":product/paloaltonetworks/demisto",<br>  "detective": ":product/amazon/detective",<br>  "disruptops": ":product/disruptops-inc/disruptops",<br>  "dome9-arc": "634729597623:product/checkpoint/dome9-arc",<br>  "fireeye-helix": "264756907367:product/fireeye/fireeye-helix",<br>  "firewall-manager": ":product/aws/firewall-manager",<br>  "forcepoint-casb": "365761988620:product/forcepoint/forcepoint-casb",<br>  "forcepoint-cloud-security-gateway": ":product/forcepoint/forcepoint-cloud-security-gateway",<br>  "forcepoint-dlp": "365761988620:product/forcepoint/forcepoint-dlp",<br>  "forcepoint-ngfw": "365761988620:product/forcepoint/forcepoint-ngfw",<br>  "fugue": ":product/fugue/fugue",<br>  "guardduty": ":product/aws/guardduty",<br>  "health": ":product/aws/health",<br>  "insight-connect": ":product/rapid7/insight-connect",<br>  "insightvm": "336818582268:product/rapid7/insightvm",<br>  "inspector": ":product/aws/inspector",<br>  "itsm": "842447150064:product/servicenow/itsm",<br>  "jira-service-management": ":product/atlassian/jira-service-management",<br>  "kube-bench": ":product/aqua-security/kube-bench",<br>  "kubernetes-security": ":product/stackrox/kubernetes-security",<br>  "macie": ":product/aws/macie",<br>  "mcafee-mvision-cloud-aws": "297986523463:product/mcafee-skyhigh/mcafee-mvision-cloud-aws",<br>  "netscout-cyber-investigator": ":product/netscout/netscout-cyber-investigator",<br>  "opsgenie": ":product/atlassian/opsgenie",<br>  "pagerduty": ":product/pagerduty/pagerduty",<br>  "paloalto-networks-vmseries": ":product/paloaltonetworks/paloalto-networks-vmseries",<br>  "phantom": ":product/splunk/phantom",<br>  "prowler": ":product/prowler/prowler",<br>  "qradar-siem": "949680696695:product/ibm/qradar-siem",<br>  "qualys-vm": "805950163170:product/qualys/qualys-vm",<br>  "redlock": "188619942792:product/paloaltonetworks/redlock",<br>  "secureclouddb": ":product/secureclouddb/secureclouddb",<br>  "slack": "429538831549:product/slack/slack",<br>  "sonrai-dig": ":product/sonrai-security/sonrai-dig",<br>  "sophos-server-protection": "062897671886:product/sophos/sophos-server-protection",<br>  "splunk-enterprise": "112543817624:product/splunk/splunk-enterprise",<br>  "ssm-patch-manager": ":product/aws/ssm-patch-manager",<br>  "sumologic-mda": "956882708938:product/sumologicinc/sumologic-mda",<br>  "symantec-cwp": "754237914691:product/symantec-corp/symantec-cwp",<br>  "sysdig-secure-for-cloud": ":product/sysdig/sysdig-secure-for-cloud",<br>  "systems-manager-opscenter-and-explorer": ":product/aws/systems-manager-opscenter-and-explorer",<br>  "tenable-io": "422820575223:product/tenable/tenable-io",<br>  "threatmodeler": ":product/threatmodeler-software/threatmodeler",<br>  "trusted-advisor": ":product/aws/trusted-advisor",<br>  "turbot": "453761072151:product/turbot/turbot",<br>  "twistlock-enterprise": "496947949261:product/twistlock/twistlock-enterprise",<br>  "vulnerability-intelligence": ":product/hackerone/vulnerability-intelligence"<br>}</pre> | no |
| <a name="input_security_administrator_account_id"></a> [security\_administrator\_account\_id](#input\_security\_administrator\_account\_id) | AWS Security Administrator Account ID | `number` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
