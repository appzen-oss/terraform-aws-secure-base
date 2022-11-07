
# GuardDuty is a monitoring service that analyzes
#   AWS CloudTrail management and Amazon S3 data events, VPC Flow Logs,
#   and DNS logs

# https://docs.aws.amazon.com/guardduty/latest/ug/what-is-guardduty.html

# Data Sources
#   CloudTrail
#   DNS Logs
#   Kubernetes
#   S3
#   VPC Flow Logs

# aws guardduty enable-organization-admin-account --admin-account-id 11111111111
# aws guardduty enable-organization-admin-account --admin-account-id 11111111111 --region us-west-2
# aws guardduty create-members --detector-id 12abc34d567e8fa901bc2d34e56789f0 --account-details AccountId=123456789012,Email=guarddutymember@amazon.com
# aws organizations list-accounts
# aws guardduty update-organization-configuration --detector-id 12abc34d567e8fa901bc2d34e56789f0 --auto-enable
# aws guardduty describe-organization-configuration —detector-id 12abc34d567e8fa901bc2d34e56789f0
# aws guardduty create-detector
# aws guardduty create-filter
# aws guardduty create-ip-set
# aws guardduty create-members
# aws guardduty create-publishing-destination
# aws guardduty create-sample-findings
# aws guardduty create-threat-intel-set

# for each region
# detector_id=$(aws guardduty list-detectors --region ${aws_region} --query DetectorIds | jq -r .[0])
# terraform import -var-file=environments/${env}/env.tfvars module.guardduty-${aws_region}.aws_guardduty_detector.self[0] ${detector_id}

# Kubernetes
#   aws guardduty update-member-detectors --detector-id 12abc34d567e8fa901bc2d34e56789f0 --account-ids 123456789012 --data-sources '{"Kubernetes":{"AuditLogs":{"Enable":true}}}'
# S3
#   aws guardduty update-member-detectors --detector-id 12abc34d567e8fa901bc2d34e56789f0 --account-ids 123456789012 --data-sources '{"S3Logs":{"Enable":true}}'

# Regional - Organization Master
# This will create a detector, if one doesn't exist
# Run terraform for administrator account first
resource "aws_guardduty_organization_admin_account" "self" {
  count            = var.enable && var.account_type == "master" ? 1 : 0
  admin_account_id = var.security_administrator_account_id
}

## Run in admin account

# Detector
# Findings -> CW & S3 (KMS symmetric)
# S3 Protection - enable
# Kubernetes Protection - enable (tf not supported yet)
# SNS
# Trusted IP lists:
#   Appzen Trusted  https://s3.amazonaws.com/appzen-trusted/trusted.txt

# aws guardduty get-detector --detector-id
# aws guardduty list-detectors
# Regional - Administrator
resource "aws_guardduty_detector" "self" {
  count                        = var.enable && var.account_type == "administrator" ? 1 : 0
  enable                       = true
  finding_publishing_frequency = var.finding_publishing_frequency
  datasources {
    s3_logs {
      enable = true
    }
  }
  tags = var.tags
}

resource "aws_organizations_organization" "self" {
  aws_service_access_principals = ["guardduty.amazonaws.com"]
  feature_set                   = "ALL"
}

# Security account to manage all members
resource "aws_guardduty_organization_admin_account" "self" {
  count       = var.security_administrator_account_id == data.aws_caller_identity.current.account_id ? 1 : 0
  depends_on  = [aws_organizations_organization.self]
  admin_account_id = var.security_administrator_account_id
}

resource "aws_guardduty_detector" "member" {
  count       = var.security_administrator_account_id == data.aws_caller_identity.current.account_id ? 1 : 0
  provider    = aws.dev
  enable      = true
}

# Regional - Administrator
resource "aws_guardduty_organization_configuration" "self" {
  count       = var.enable && var.account_type == "administrator" ? 1 : 0
  auto_enable = true
  detector_id = aws_guardduty_detector.self[0].id
  datasources {
    s3_logs {
      auto_enable = true
    }
  }
}

#dynamic "datasources" {
#  for_each = var.datasources
#  content {
#    datasources.value["source"] {
#      enable      = datasources.value["enable"]
#    }
#  }
#}
#variable "datasources" {
#  description = "Detector data sources"
#  type = list(map(any))
#  default = [
#    {
#      source = "s3_logs"
#      enable = true
#    }
#  ]
#}

# Sent findings to S3
# Regional - All accounts
#resource "aws_guardduty_publishing_destination" "self" {
#  count = var.enable ? 1 : 0
#  detector_id     = aws_guardduty_detector.self[0].id
#  destination_arn = aws_s3_bucket.gd_bucket.arn
#  kms_key_arn     = aws_kms_key.gd_key.arn
#
#  depends_on = [
#    aws_s3_bucket_policy.gd_bucket_policy,
#  ]
#}

# Trusted IP lists:
#   Appzen Trusted  https://s3.amazonaws.com/appzen-trusted/trusted.txt
# Regional - Administrator
#resource "aws_guardduty_ipset" "example" {
#  count = var.enable && var.account_type == "administrator" ? 1 : 0
#  activate    = true
#  detector_id = aws_guardduty_detector.self[0].id
#  format      = "TXT"
#  location    = "https://s3.amazonaws.com/${aws_s3_object.MyIPSet.bucket}/${aws_s3_object.MyIPSet.key}"
#  name        = "MyIPSet"
#}

#resource "aws_guardduty_member" "member" {
#  account_id         = aws_guardduty_detector.member.account_id
#  detector_id        = aws_guardduty_detector.primary.id
#  email              = "required@example.com"
#  invite             = true
#  invitation_message = "please accept guardduty invitation"
#}
#
#resource "aws_guardduty_invite_accepter" "member" {
#  depends_on = [aws_guardduty_member.member]
#  #provider   = aws.member
#  detector_id       = aws_guardduty_detector.member.id
#  master_account_id = aws_guardduty_detector.primary.account_id
#}
#
