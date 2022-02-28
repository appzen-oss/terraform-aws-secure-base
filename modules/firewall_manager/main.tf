
# https://docs.aws.amazon.com/organizations/latest/userguide/services-that-can-integrate-fms.html

# Requires: config, RAM

#aws ram enable-sharing-with-aws-organization
#aws organizations enable-aws-service-access \
#    --service-principal fms.amazonaws.com
#aws fms associate-admin-account
#aws fms put-apps-list
#aws fms put-notification-channel
#aws fms put-policy
#aws fms put-protocols-list

# Organization Master in us-east-1
resource "aws_fms_admin_account" "self" {
  count      = var.enable && var.account_type == "master" ? 1 : 0
  account_id = var.security_administrator_account_id
}

#resource "aws_fms_policy" "example" {}
# count = var.enable && var.account_type == "administrator" ? 1 : 0

# SNS topics
# Security Policies (create)
# Application lists (default managed lists - cannot modify)
#   FMS-Default-Public-Access-Apps-Allowed  : TCP 80/443
#   FMS-Default-Public-Access-Apps-Denied
# Protocol Lists (default managed lists - cannot modify)
#   FMS-Default-Protocols-Allowed           : TCP UDP
