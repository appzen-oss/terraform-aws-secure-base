#
# Migrate to count on each module
#

moved {
  from = module.baseline_ebs_eu-west-1.aws_ebs_encryption_by_default.self[0]
  to   = module.baseline_ebs_eu-west-1[0].aws_ebs_encryption_by_default.self[0]
}
moved {
  from = module.baseline_ebs_us-east-1.aws_ebs_encryption_by_default.self[0]
  to   = module.baseline_ebs_us-east-1[0].aws_ebs_encryption_by_default.self[0]
}
moved {
  from = module.baseline_ebs_us-east-2.aws_ebs_encryption_by_default.self[0]
  to   = module.baseline_ebs_us-east-2[0].aws_ebs_encryption_by_default.self[0]
}
moved {
  from = module.baseline_ecr_eu-west-1.aws_ecr_registry_scanning_configuration.self[0]
  to   = module.baseline_ecr_eu-west-1[0].aws_ecr_registry_scanning_configuration.self[0]
}
moved {
  from = module.baseline_ecr_us-east-1.aws_ecr_registry_scanning_configuration.self[0]
  to   = module.baseline_ecr_us-east-1[0].aws_ecr_registry_scanning_configuration.self[0]
}
moved {
  from = module.baseline_ecr_us-east-2.aws_ecr_registry_scanning_configuration.self[0]
  to   = module.baseline_ecr_us-east-2[0].aws_ecr_registry_scanning_configuration.self[0]
}
moved {
  from = module.baseline_iam.aws_iam_account_password_policy.default[0]
  to   = module.baseline_iam[0].aws_iam_account_password_policy.default[0]
}
moved {
  from = module.baseline_s3.aws_s3_account_public_access_block.this[0]
  to   = module.baseline_s3[0].aws_s3_account_public_access_block.this[0]
}
moved {
  from = module.guardduty-eu-west-1.aws_guardduty_detector.self[0]
  to   = module.guardduty-eu-west-1[0].aws_guardduty_detector.self[0]
}
moved {
  from = module.guardduty-us-east-1.aws_guardduty_detector.self[0]
  to   = module.guardduty-us-east-1[0].aws_guardduty_detector.self[0]
}
moved {
  from = module.guardduty-us-east-2.aws_guardduty_detector.self[0]
  to   = module.guardduty-us-east-2[0].aws_guardduty_detector.self[0]
}
moved {
  from = module.iam_access_analyzer-eu-west-1.aws_accessanalyzer_analyzer.self[0]
  to   = module.iam_access_analyzer-eu-west-1[0].aws_accessanalyzer_analyzer.self[0]
}
moved {
  from = module.iam_access_analyzer-us-east-1.aws_accessanalyzer_analyzer.self[0]
  to   = module.iam_access_analyzer-us-east-1[0].aws_accessanalyzer_analyzer.self[0]
}
moved {
  from = module.iam_access_analyzer-us-east-2.aws_accessanalyzer_analyzer.self[0]
  to   = module.iam_access_analyzer-us-east-2[0].aws_accessanalyzer_analyzer.self[0]
}
moved {
  from = module.securityhub_eu-west-1.aws_securityhub_account.self[0]
  to   = module.securityhub_eu-west-1[0].aws_securityhub_account.self[0]
}
moved {
  from = module.securityhub_us-east-1.aws_securityhub_account.self[0]
  to   = module.securityhub_us-east-1[0].aws_securityhub_account.self[0]
}
moved {
  from = module.securityhub_us-east-2.aws_securityhub_account.self[0]
  to   = module.securityhub_us-east-2[0].aws_securityhub_account.self[0]
}
