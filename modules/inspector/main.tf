

# https://docs.aws.amazon.com/organizations/latest/userguide/services-that-can-integrate-inspector2.html#integrate-enable-da-inspector2

#aws organizations register-delegated-administrator \
#   --account-id 123456789012 \
#   --service-principal inspector2.amazonaws.com

#aws inspector2 enable [--account-ids X] --resource_types "ECR"
#aws inspector2 enable-delegated-admin-account --delegated-admin-account-id ID
#aws inspector2 update-organization-configuration --auto-enable ec2=false,ecr=true

# tf does not support inspector2 yet

#  unrecognized service principal
# Organization Master - Regional
#resource "aws_organizations_delegated_administrator" "inspector2" {
#  count             = var.enable && var.account_type == "master" ? 1 : 0
#  account_id        = var.org_administrator_account_id
#  service_principal = "inspector2.amazonaws.com"
#}

resource "aws_inspector2_delegated_admin_account" "self" {
  count      = var.enable ? 1 : 0
  account_id = var.security_administrator_account_id
}
