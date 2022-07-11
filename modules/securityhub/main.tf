
# account_id=$(aws securityhub describe-hub | jq -r .HubArn | cut -d: -f5)
# terraform import -var-file=environments/${env}/env.tfvars module.securityhub_${aws_region}.aws_securityhub_account.self[0] ${account_id}

#data "aws_region" "current" {}

# Regional - All accounts
resource "aws_securityhub_account" "self" {
  count = var.enable ? 1 : 0
}

# Regional - Organization Master
resource "aws_securityhub_organization_admin_account" "self" {
  count            = var.enable && var.account_type == "master" ? 1 : 0
  admin_account_id = var.security_administrator_account_id
}

# Auto enable security hub in organization member accounts
# Regional - Administrator
resource "aws_securityhub_organization_configuration" "self" {
  count       = var.enable && var.account_type == "administrator" ? 1 : 0
  auto_enable = true
}

# variable aggregator_region = "us-east-1"
# Only in aggregator region - us-east-1
# Only in administrator account ?
#resource "aws_securityhub_finding_aggregator" "self" {
#  count = var.enable && var.account_type == "administrator" ? 1 : 0
#     && data.aws_region.current.name == "us-east-1"
#  linking_mode = "ALL_REGIONS"
#  depends_on = [aws_securityhub_account.self]
#}

#resource "aws_securityhub_standards_control" "ensure_iam_password_policy_prevents_password_reuse" {
#  standards_control_arn = "arn:aws:securityhub:us-east-1:111111111111:control/cis-aws-foundations-benchmark/v/1.2.0/1.10"
#  control_status        = "DISABLED"
#  disabled_reason       = "We handle password policies within Okta"
#  depends_on = [aws_securityhub_standards_subscription.cis_aws_foundations_benchmark]
#}

# Where should these be setup?
## --------------------------------------------------------------------------------------------------
## Subscribe CIS AWS Foundations Benchmark
## --------------------------------------------------------------------------------------------------
#resource "aws_securityhub_standards_subscription" "cis_aws_foundations_benchmark" {
#  count = var.enable && var.enable_cis_standard ? 1 : 0
#  standards_arn = "arn:aws:securityhub:::ruleset/cis-aws-foundations-benchmark/v/1.2.0"
#  depends_on = [aws_securityhub_account.self]
#}
## --------------------------------------------------------------------------------------------------
## Subscribe AWS Foundational Security Best Practices
## --------------------------------------------------------------------------------------------------
#resource "aws_securityhub_standards_subscription" "aws_foundational" {
#  count = var.enable && var.enable_aws_foundational_standard ? 1 :
#  standards_arn = "arn:aws:securityhub:${data.aws_region.current.name}::standards/aws-foundational-security-best-practices/v/1.0.0
#  depends_on = [aws_securityhub_account.self]
#}
## --------------------------------------------------------------------------------------------------
## Subscribe PCI DSS standard
## --------------------------------------------------------------------------------------------------
#resource "aws_securityhub_standards_subscription" "pci_dss" {
#  count = var.enable && var.enable_pci_dss_standard ? 1 : 0
#  standards_arn = "arn:aws:securityhub:${data.aws_region.current.name}::standards/pci-dss/v/3.2.1
#  depends_on = [aws_securityhub_account.self]
#}
## --------------------------------------------------------------------------------------------------
## Subscribe to 3rd party products
## --------------------------------------------------------------------------------------------------

#resource "aws_securityhub_product_subscription" "example" {
#  depends_on  = [aws_securityhub_account.self]
#  product_arn = "arn:aws:securityhub:${data.aws_region.current.name}:733251395267:product/alertlogic/althreatmanagement"
#}

resource "aws_securityhub_product_subscription" "self" {
  count      = var.enable ? length(var.enable_products) : 0
  depends_on = [aws_securityhub_account.self]
  product_arn = format("arn:aws:securityhub:%s:%s",
    data.aws_region.current.name,
    var.product_arns[var.enable_products[count.index]]
  )
}
