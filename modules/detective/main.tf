
# https://docs.aws.amazon.com/detective/latest/adminguide/what-is-detective.html

# Requirements
#   GuardDuty enabled for at least 48 hours

# Data Sources
#   CloudTrail
#   GuardDuty
#   VPC Flow Logs

# https://docs.aws.amazon.com/organizations/latest/userguide/services-that-can-integrate-detective.html#integrate-enable-da-detective
# aws organizations register-delegated-administrator \
#    --account-id 123456789012 \
#    --service-principal detective.amazonaws.com
#aws detective enable-organization-admin-account --account-id <admin account ID>

resource "aws_organizations_delegated_administrator" "detective" {
  count             = var.enable && var.account_type == "master" ? 1 : 0
  account_id        = var.security_administrator_account_id
  service_principal = "detective.amazonaws.com"
}

# Regional - enables detective
#resource "aws_detective_graph" "default" {
#  count = var.enable && var.account_type == "adminstrator" ? 1 : 0
#  tags = var.tags
#}

#resource "aws_detective_member" "example" {
#  account_id                 = "AWS ACCOUNT ID"
#  email_address              = "EMAIL"
#  graph_arn                  = aws_detective_graph.example.id
#  message                    = "Message of the invitation"
#  disable_email_notification = true
#}
#resource "aws_detective_invitation_accepter" "member" {
#  provider  = "awsalternate"
#  graph_arn = aws_detective_member.primary.graph_arn
#  depends_on = [aws_detective_member.test]
#}
