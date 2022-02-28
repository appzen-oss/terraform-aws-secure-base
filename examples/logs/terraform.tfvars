# Logs account
account_type                      = "member"
aws_profile                       = "#AWS profile#"
security_administrator_account_id = 123456789012
target_regions                    = ["us-east-1"]

# Infrastructure
enable_s3_buckets = false

# AWS Account/Region security settings
enable_ebs_baseline = false
enable_ecr_baseline = false
enable_iam_baseline = false
enable_s3_baseline  = false

# AWS Security Services
enable_cloudtrail          = false
enable_config              = false
enable_firewall_manager    = false
enable_guardduty           = false
enable_iam_access_analyzer = false
enable_securityhub         = false
