# did not use cloudposse due to the below is only true for one region
#  #source = "cloudposse/config/aws"
#  #version     = "0.16.0"
## aws configservice describe-configuration-recorders --query ConfigurationRecorders[].recordingGroup.includeGlobalResourceTypes

locals {
  iam_role_arn  = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/config"
}

## Commented due to - Error: missing provider module.secure-base.provider["registry.terraform.io/hashicorp/aws"].af-south-1
#module "config_af-south-1" {
#  count                 = contains(local.region_list, "af-south-1") ? 1 : 0
#  source                = "cloudposse/config/aws"
#  version               = "0.17.0"
#  create_sns_topic      = true
#  create_iam_role       = var.org_primary_region == "af-south-1"
#  iam_role_arn          = var.org_primary_region == "af-south-1" ? "" : local.iam_role_arn
#  managed_rules         = {
#    account-part-of-organizations = {
#      description       = "Checks whether AWS account is part of AWS Organizations. The rule is NON_COMPLIANT if an AWS account is not part of AWS Organizations or AWS Organizations master account ID does not match rule parameter MasterAccountId.",
#      identifier        = "ACCOUNT_PART_OF_ORGANIZATIONS",
#      trigger_type      = "PERIODIC"
#      enabled           = true
#      input_parameters  = ""
#      tags              = var.tags
#    }
#  }
#  providers             = {
#    aws = aws.af-south-1
#  }
#  s3_bucket_id                      = var.log_s3_bucket
#  s3_bucket_arn                     = "arn:aws:s3:::${var.log_s3_bucket}"
#  s3_key_prefix                     = var.config_s3_key_prefix
#  sns_encryption_key_id             = var.sns_encryption_key_id
#  tags                              = var.tags
#  global_resource_collector_region  = var.org_primary_region
#}

#module "config_ap-east-1" {
#  count                 = contains(local.region_list, "ap-east-1") ? 1 : 0
#  source                = "cloudposse/config/aws"
#  version               = "0.17.0"
#  create_sns_topic      = true
#  create_iam_role       = var.org_primary_region == "ap-east-1"
#  iam_role_arn          = var.org_primary_region == "ap-east-1" ? "" : local.iam_role_arn
#  managed_rules         = {
#    account-part-of-organizations = {
#      description       = "Checks whether AWS account is part of AWS Organizations. The rule is NON_COMPLIANT if an AWS account is not part of AWS Organizations or AWS Organizations master account ID does not match rule parameter MasterAccountId.",
#      identifier        = "ACCOUNT_PART_OF_ORGANIZATIONS",
#      trigger_type      = "PERIODIC"
#      enabled           = true
#      input_parameters  = ""
#      tags              = var.tags
#    }
#  }
#  providers             = {
#    aws = aws.ap-east-1
#  }
#  s3_bucket_id                      = var.log_s3_bucket
#  s3_bucket_arn                     = "arn:aws:s3:::${var.log_s3_bucket}"
#  s3_key_prefix                     = var.config_s3_key_prefix
#  sns_encryption_key_id             = var.sns_encryption_key_id
#  tags                              = var.tags
#  global_resource_collector_region  = var.org_primary_region
#}

module "config_ap-northeast-1" {
  count                 = contains(local.region_list, "ap-northeast-1") ? 1 : 0
  source                = "cloudposse/config/aws"
  version               = "0.17.0"
  create_sns_topic      = true
  create_iam_role       = var.org_primary_region == "ap-northeast-1"
  iam_role_arn          = var.org_primary_region == "ap-northeast-1" ? "" : local.iam_role_arn
  managed_rules         = {
    account-part-of-organizations = {
      description       = "Checks whether AWS account is part of AWS Organizations. The rule is NON_COMPLIANT if an AWS account is not part of AWS Organizations or AWS Organizations master account ID does not match rule parameter MasterAccountId.",
      identifier        = "ACCOUNT_PART_OF_ORGANIZATIONS",
      trigger_type      = "PERIODIC"
      enabled           = true
      input_parameters  = ""
      tags              = var.tags
    }
  }
  providers             = {
    aws = aws.ap-northeast-1
  }
  s3_bucket_id                      = var.log_s3_bucket
  s3_bucket_arn                     = "arn:aws:s3:::${var.log_s3_bucket}"
  s3_key_prefix                     = var.config_s3_key_prefix
  sns_encryption_key_id             = var.sns_encryption_key_id
  tags                              = var.tags
  global_resource_collector_region  = var.org_primary_region
}

module "config_ap-northeast-2" {
  count                 = contains(local.region_list, "ap-northeast-2") ? 1 : 0
  source                = "cloudposse/config/aws"
  version               = "0.17.0"
  create_sns_topic      = true
  create_iam_role       = var.org_primary_region == "ap-northeast-2"
  iam_role_arn          = var.org_primary_region == "ap-northeast-2" ? "" : local.iam_role_arn
  managed_rules         = {
    account-part-of-organizations = {
      description       = "Checks whether AWS account is part of AWS Organizations. The rule is NON_COMPLIANT if an AWS account is not part of AWS Organizations or AWS Organizations master account ID does not match rule parameter MasterAccountId.",
      identifier        = "ACCOUNT_PART_OF_ORGANIZATIONS",
      trigger_type      = "PERIODIC"
      enabled           = true
      input_parameters  = ""
      tags              = var.tags
    }
  }
  providers             = {
    aws = aws.ap-northeast-2
  }
  s3_bucket_id                      = var.log_s3_bucket
  s3_bucket_arn                     = "arn:aws:s3:::${var.log_s3_bucket}"
  s3_key_prefix                     = var.config_s3_key_prefix
  sns_encryption_key_id             = var.sns_encryption_key_id
  tags                              = var.tags
  global_resource_collector_region  = var.org_primary_region
}

#module "config_ap-northeast-3" {
#  count                 = contains(local.region_list, "ap-northeast-3") ? 1 : 0
#  source                = "cloudposse/config/aws"
#  version               = "0.17.0"
#  create_sns_topic      = true
#  create_iam_role       = var.org_primary_region == "ap-northeast-3"
#  iam_role_arn          = var.org_primary_region == "ap-northeast-3" ? "" : local.iam_role_arn
#  managed_rules         = {
#    account-part-of-organizations = {
#      description       = "Checks whether AWS account is part of AWS Organizations. The rule is NON_COMPLIANT if an AWS account is not part of AWS Organizations or AWS Organizations master account ID does not match rule parameter MasterAccountId.",
#      identifier        = "ACCOUNT_PART_OF_ORGANIZATIONS",
#      trigger_type      = "PERIODIC"
#      enabled           = true
#      input_parameters  = ""
#      tags              = var.tags
#    }
#  }
#  providers             = {
#    aws = aws.ap-northeast-3
#  }
#  s3_bucket_id                      = var.log_s3_bucket
#  s3_bucket_arn                     = "arn:aws:s3:::${var.log_s3_bucket}"
#  s3_key_prefix                     = var.config_s3_key_prefix
#  sns_encryption_key_id             = var.sns_encryption_key_id
#  tags                              = var.tags
#  global_resource_collector_region  = var.org_primary_region
#}

module "config_ap-south-1" {
  count                 = contains(local.region_list, "ap-south-1") ? 1 : 0
  source                = "cloudposse/config/aws"
  version               = "0.17.0"
  create_sns_topic      = true
  create_iam_role       = var.org_primary_region == "ap-south-1"
  iam_role_arn          = var.org_primary_region == "ap-south-1" ? "" : local.iam_role_arn
  managed_rules         = {
    account-part-of-organizations = {
      description       = "Checks whether AWS account is part of AWS Organizations. The rule is NON_COMPLIANT if an AWS account is not part of AWS Organizations or AWS Organizations master account ID does not match rule parameter MasterAccountId.",
      identifier        = "ACCOUNT_PART_OF_ORGANIZATIONS",
      trigger_type      = "PERIODIC"
      enabled           = true
      input_parameters  = ""
      tags              = var.tags
    }
  }
  providers             = {
    aws = aws.ap-south-1
  }
  s3_bucket_id                      = var.log_s3_bucket
  s3_bucket_arn                     = "arn:aws:s3:::${var.log_s3_bucket}"
  s3_key_prefix                     = var.config_s3_key_prefix
  sns_encryption_key_id             = var.sns_encryption_key_id
  tags                              = var.tags
  global_resource_collector_region  = var.org_primary_region
}

#module "config_ap-south-2" {
#  count                 = contains(local.region_list, "ap-south-2") ? 1 : 0
#  source                = "cloudposse/config/aws"
#  version               = "0.17.0"
#  create_sns_topic      = true
#  create_iam_role       = var.org_primary_region == "ap-south-2"
#  iam_role_arn          = var.org_primary_region == "ap-south-2" ? "" : local.iam_role_arn
#  managed_rules         = {
#    account-part-of-organizations = {
#      description       = "Checks whether AWS account is part of AWS Organizations. The rule is NON_COMPLIANT if an AWS account is not part of AWS Organizations or AWS Organizations master account ID does not match rule parameter MasterAccountId.",
#      identifier        = "ACCOUNT_PART_OF_ORGANIZATIONS",
#      trigger_type      = "PERIODIC"
#      enabled           = true
#      input_parameters  = ""
#      tags              = var.tags
#    }
#  }
#  providers             = {
#    aws = aws.ap-south-2
#  }
#  s3_bucket_id                      = var.log_s3_bucket
#  s3_bucket_arn                     = "arn:aws:s3:::${var.log_s3_bucket}"
#  s3_key_prefix                     = var.config_s3_key_prefix
#  sns_encryption_key_id             = var.sns_encryption_key_id
#  tags                              = var.tags
#  global_resource_collector_region  = var.org_primary_region
#}

module "config_ap-southeast-1" {
  count                 = contains(local.region_list, "ap-southeast-1") ? 1 : 0
  source                = "cloudposse/config/aws"
  version               = "0.17.0"
  create_sns_topic      = true
  create_iam_role       = var.org_primary_region == "ap-southeast-1"
  iam_role_arn          = var.org_primary_region == "ap-southeast-1" ? "" : local.iam_role_arn
  managed_rules         = {
    account-part-of-organizations = {
      description       = "Checks whether AWS account is part of AWS Organizations. The rule is NON_COMPLIANT if an AWS account is not part of AWS Organizations or AWS Organizations master account ID does not match rule parameter MasterAccountId.",
      identifier        = "ACCOUNT_PART_OF_ORGANIZATIONS",
      trigger_type      = "PERIODIC"
      enabled           = true
      input_parameters  = ""
      tags              = var.tags
    }
  }
  providers             = {
    aws = aws.ap-southeast-1
  }
  s3_bucket_id                      = var.log_s3_bucket
  s3_bucket_arn                     = "arn:aws:s3:::${var.log_s3_bucket}"
  s3_key_prefix                     = var.config_s3_key_prefix
  sns_encryption_key_id             = var.sns_encryption_key_id
  tags                              = var.tags
  global_resource_collector_region  = var.org_primary_region
}

module "config_ap-southeast-2" {
  count                 = contains(local.region_list, "ap-southeast-2") ? 1 : 0
  source                = "cloudposse/config/aws"
  version               = "0.17.0"
  create_sns_topic      = true
  create_iam_role       = var.org_primary_region == "ap-southeast-2"
  iam_role_arn          = var.org_primary_region == "ap-southeast-2" ? "" : local.iam_role_arn
  managed_rules         = {
    account-part-of-organizations = {
      description       = "Checks whether AWS account is part of AWS Organizations. The rule is NON_COMPLIANT if an AWS account is not part of AWS Organizations or AWS Organizations master account ID does not match rule parameter MasterAccountId.",
      identifier        = "ACCOUNT_PART_OF_ORGANIZATIONS",
      trigger_type      = "PERIODIC"
      enabled           = true
      input_parameters  = ""
      tags              = var.tags
    }
  }
  providers             = {
    aws = aws.ap-southeast-2
  }
  s3_bucket_id                      = var.log_s3_bucket
  s3_bucket_arn                     = "arn:aws:s3:::${var.log_s3_bucket}"
  s3_key_prefix                     = var.config_s3_key_prefix
  sns_encryption_key_id             = var.sns_encryption_key_id
  tags                              = var.tags
  global_resource_collector_region  = var.org_primary_region
}

#module "config_ap-southeast-3" {
#  count                 = contains(local.region_list, "ap-southeast-3") ? 1 : 0
#  source                = "cloudposse/config/aws"
#  version               = "0.17.0"
#  create_sns_topic      = true
#  create_iam_role       = var.org_primary_region == "ap-southeast-3"
#  iam_role_arn          = var.org_primary_region == "ap-southeast-3" ? "" : local.iam_role_arn
#  managed_rules         = {
#    account-part-of-organizations = {
#      description       = "Checks whether AWS account is part of AWS Organizations. The rule is NON_COMPLIANT if an AWS account is not part of AWS Organizations or AWS Organizations master account ID does not match rule parameter MasterAccountId.",
#      identifier        = "ACCOUNT_PART_OF_ORGANIZATIONS",
#      trigger_type      = "PERIODIC"
#      enabled           = true
#      input_parameters  = ""
#      tags              = var.tags
#    }
#  }
#  providers             = {
#    aws = aws.ap-southeast-3
#  }
#  s3_bucket_id                      = var.log_s3_bucket
#  s3_bucket_arn                     = "arn:aws:s3:::${var.log_s3_bucket}"
#  s3_key_prefix                     = var.config_s3_key_prefix
#  sns_encryption_key_id             = var.sns_encryption_key_id
#  tags                              = var.tags
#  global_resource_collector_region  = var.org_primary_region
#}

#module "config_ap-southeast-4" {
#  count                 = contains(local.region_list, "ap-southeast-4") ? 1 : 0
#  source                = "cloudposse/config/aws"
#  version               = "0.17.0"
#  create_sns_topic      = true
#  create_iam_role       = var.org_primary_region == "ap-southeast-4"
#  iam_role_arn          = var.org_primary_region == "ap-southeast-4" ? "" : local.iam_role_arn
#  managed_rules         = {
#    account-part-of-organizations = {
#      description       = "Checks whether AWS account is part of AWS Organizations. The rule is NON_COMPLIANT if an AWS account is not part of AWS Organizations or AWS Organizations master account ID does not match rule parameter MasterAccountId.",
#      identifier        = "ACCOUNT_PART_OF_ORGANIZATIONS",
#      trigger_type      = "PERIODIC"
#      enabled           = true
#      input_parameters  = ""
#      tags              = var.tags
#    }
#  }
#  providers             = {
#    aws = aws.ap-southeast-4
#  }
#  s3_bucket_id                      = var.log_s3_bucket
#  s3_bucket_arn                     = "arn:aws:s3:::${var.log_s3_bucket}"
#  s3_key_prefix                     = var.config_s3_key_prefix
#  sns_encryption_key_id             = var.sns_encryption_key_id
#  tags                              = var.tags
#  global_resource_collector_region  = var.org_primary_region
#}

module "config_ca-central-1" {
  count                 = contains(local.region_list, "ca-central-1") ? 1 : 0
  source                = "cloudposse/config/aws"
  version               = "0.17.0"
  create_sns_topic      = true
  create_iam_role       = var.org_primary_region == "ca-central-1"
  iam_role_arn          = var.org_primary_region == "ca-central-1" ? "" : local.iam_role_arn
  managed_rules         = {
    account-part-of-organizations = {
      description       = "Checks whether AWS account is part of AWS Organizations. The rule is NON_COMPLIANT if an AWS account is not part of AWS Organizations or AWS Organizations master account ID does not match rule parameter MasterAccountId.",
      identifier        = "ACCOUNT_PART_OF_ORGANIZATIONS",
      trigger_type      = "PERIODIC"
      enabled           = true
      input_parameters  = ""
      tags              = var.tags
    }
  }
  providers             = {
    aws = aws.ca-central-1
  }
  s3_bucket_id                      = var.log_s3_bucket
  s3_bucket_arn                     = "arn:aws:s3:::${var.log_s3_bucket}"
  s3_key_prefix                     = var.config_s3_key_prefix
  sns_encryption_key_id             = var.sns_encryption_key_id
  tags                              = var.tags
  global_resource_collector_region  = var.org_primary_region
}

module "config_eu-central-1" {
  count                 = contains(local.region_list, "eu-central-1") ? 1 : 0
  source                = "cloudposse/config/aws"
  version               = "0.17.0"
  create_sns_topic      = true
  create_iam_role       = var.org_primary_region == "eu-central-1"
  iam_role_arn          = var.org_primary_region == "eu-central-1" ? "" : local.iam_role_arn
  managed_rules         = {
    account-part-of-organizations = {
      description       = "Checks whether AWS account is part of AWS Organizations. The rule is NON_COMPLIANT if an AWS account is not part of AWS Organizations or AWS Organizations master account ID does not match rule parameter MasterAccountId.",
      identifier        = "ACCOUNT_PART_OF_ORGANIZATIONS",
      trigger_type      = "PERIODIC"
      enabled           = true
      input_parameters  = ""
      tags              = var.tags
    }
  }
  providers             = {
    aws = aws.eu-central-1
  }
  s3_bucket_id                      = var.log_s3_bucket
  s3_bucket_arn                     = "arn:aws:s3:::${var.log_s3_bucket}"
  s3_key_prefix                     = var.config_s3_key_prefix
  sns_encryption_key_id             = var.sns_encryption_key_id
  tags                              = var.tags
  global_resource_collector_region  = var.org_primary_region
}

#module "config_eu-central-2" {
#  count                 = contains(local.region_list, "eu-central-2") ? 1 : 0
#  source                = "cloudposse/config/aws"
#  version               = "0.17.0"
#  create_sns_topic      = true
#  create_iam_role       = var.org_primary_region == "eu-central-2"
#  iam_role_arn          = var.org_primary_region == "eu-central-2" ? "" : local.iam_role_arn
#  managed_rules         = {
#    account-part-of-organizations = {
#      description       = "Checks whether AWS account is part of AWS Organizations. The rule is NON_COMPLIANT if an AWS account is not part of AWS Organizations or AWS Organizations master account ID does not match rule parameter MasterAccountId.",
#      identifier        = "ACCOUNT_PART_OF_ORGANIZATIONS",
#      trigger_type      = "PERIODIC"
#      enabled           = true
#      input_parameters  = ""
#      tags              = var.tags
#    }
#  }
#  providers             = {
#    aws = aws.eu-central-2
#  }
#  s3_bucket_id                      = var.log_s3_bucket
#  s3_bucket_arn                     = "arn:aws:s3:::${var.log_s3_bucket}"
#  s3_key_prefix                     = var.config_s3_key_prefix
#  sns_encryption_key_id             = var.sns_encryption_key_id
#  tags                              = var.tags
#  global_resource_collector_region  = var.org_primary_region
#}

module "config_eu-north-1" {
  count                 = contains(local.region_list, "eu-north-1") ? 1 : 0
  source                = "cloudposse/config/aws"
  version               = "0.17.0"
  create_sns_topic      = true
  create_iam_role       = var.org_primary_region == "eu-north-1"
  iam_role_arn          = var.org_primary_region == "eu-north-1" ? "" : local.iam_role_arn
  managed_rules         = {
    account-part-of-organizations = {
      description       = "Checks whether AWS account is part of AWS Organizations. The rule is NON_COMPLIANT if an AWS account is not part of AWS Organizations or AWS Organizations master account ID does not match rule parameter MasterAccountId.",
      identifier        = "ACCOUNT_PART_OF_ORGANIZATIONS",
      trigger_type      = "PERIODIC"
      enabled           = true
      input_parameters  = ""
      tags              = var.tags
    }
  }
  providers             = {
    aws = aws.eu-north-1
  }
  s3_bucket_id                      = var.log_s3_bucket
  s3_bucket_arn                     = "arn:aws:s3:::${var.log_s3_bucket}"
  s3_key_prefix                     = var.config_s3_key_prefix
  sns_encryption_key_id             = var.sns_encryption_key_id
  tags                              = var.tags
  global_resource_collector_region  = var.org_primary_region
}

#module "config_eu-south-1" {
#  count                 = contains(local.region_list, "eu-south-1") ? 1 : 0
#  source                = "cloudposse/config/aws"
#  version               = "0.17.0"
#  create_sns_topic      = true
#  create_iam_role       = var.org_primary_region == "eu-south-1"
#  iam_role_arn          = var.org_primary_region == "eu-south-1" ? "" : local.iam_role_arn
#  managed_rules         = {
#    account-part-of-organizations = {
#      description       = "Checks whether AWS account is part of AWS Organizations. The rule is NON_COMPLIANT if an AWS account is not part of AWS Organizations or AWS Organizations master account ID does not match rule parameter MasterAccountId.",
#      identifier        = "ACCOUNT_PART_OF_ORGANIZATIONS",
#      trigger_type      = "PERIODIC"
#      enabled           = true
#      input_parameters  = ""
#      tags              = var.tags
#    }
#  }
#  providers             = {
#    aws = aws.eu-south-1
#  }
#  s3_bucket_id                      = var.log_s3_bucket
#  s3_bucket_arn                     = "arn:aws:s3:::${var.log_s3_bucket}"
#  s3_key_prefix                     = var.config_s3_key_prefix
#  sns_encryption_key_id             = var.sns_encryption_key_id
#  tags                              = var.tags
#  global_resource_collector_region  = var.org_primary_region
#}

#module "config_eu-south-2" {
#  count                 = contains(local.region_list, "eu-south-2") ? 1 : 0
#  source                = "cloudposse/config/aws"
#  version               = "0.17.0"
#  create_sns_topic      = true
#  create_iam_role       = var.org_primary_region == "eu-south-2"
#  iam_role_arn          = var.org_primary_region == "eu-south-2" ? "" : local.iam_role_arn
#  managed_rules         = {
#    account-part-of-organizations = {
#      description       = "Checks whether AWS account is part of AWS Organizations. The rule is NON_COMPLIANT if an AWS account is not part of AWS Organizations or AWS Organizations master account ID does not match rule parameter MasterAccountId.",
#      identifier        = "ACCOUNT_PART_OF_ORGANIZATIONS",
#      trigger_type      = "PERIODIC"
#      enabled           = true
#      input_parameters  = ""
#      tags              = var.tags
#    }
#  }
#  providers             = {
#    aws = aws.eu-south-2
#  }
#  s3_bucket_id                      = var.log_s3_bucket
#  s3_bucket_arn                     = "arn:aws:s3:::${var.log_s3_bucket}"
#  s3_key_prefix                     = var.config_s3_key_prefix
#  sns_encryption_key_id             = var.sns_encryption_key_id
#  tags                              = var.tags
#  global_resource_collector_region  = var.org_primary_region
#}

module "config_eu-west-1" {
  count                 = contains(local.region_list, "eu-west-1") ? 1 : 0
  source                = "cloudposse/config/aws"
  version               = "0.17.0"
  create_sns_topic      = true
  create_iam_role       = var.org_primary_region == "eu-west-1"
  iam_role_arn          = var.org_primary_region == "eu-west-1" ? "" : local.iam_role_arn
  managed_rules         = {
    account-part-of-organizations = {
      description       = "Checks whether AWS account is part of AWS Organizations. The rule is NON_COMPLIANT if an AWS account is not part of AWS Organizations or AWS Organizations master account ID does not match rule parameter MasterAccountId.",
      identifier        = "ACCOUNT_PART_OF_ORGANIZATIONS",
      trigger_type      = "PERIODIC"
      enabled           = true
      input_parameters  = ""
      tags              = var.tags
    }
  }
  providers             = {
    aws = aws.eu-west-1
  }
  s3_bucket_id                      = var.log_s3_bucket
  s3_bucket_arn                     = "arn:aws:s3:::${var.log_s3_bucket}"
  s3_key_prefix                     = var.config_s3_key_prefix
  sns_encryption_key_id             = var.sns_encryption_key_id
  tags                              = var.tags
  global_resource_collector_region  = var.org_primary_region
}

module "config_eu-west-2" {
  count                 = contains(local.region_list, "eu-west-2") ? 1 : 0
  source                = "cloudposse/config/aws"
  version               = "0.17.0"
  create_sns_topic      = true
  create_iam_role       = var.org_primary_region == "eu-west-2"
  iam_role_arn          = var.org_primary_region == "eu-west-2" ? "" : local.iam_role_arn
  managed_rules         = {
    account-part-of-organizations = {
      description       = "Checks whether AWS account is part of AWS Organizations. The rule is NON_COMPLIANT if an AWS account is not part of AWS Organizations or AWS Organizations master account ID does not match rule parameter MasterAccountId.",
      identifier        = "ACCOUNT_PART_OF_ORGANIZATIONS",
      trigger_type      = "PERIODIC"
      enabled           = true
      input_parameters  = ""
      tags              = var.tags
    }
  }
  providers             = {
    aws = aws.eu-west-2
  }
  s3_bucket_id                      = var.log_s3_bucket
  s3_bucket_arn                     = "arn:aws:s3:::${var.log_s3_bucket}"
  s3_key_prefix                     = var.config_s3_key_prefix
  sns_encryption_key_id             = var.sns_encryption_key_id
  tags                              = var.tags
  global_resource_collector_region  = var.org_primary_region
}

module "config_eu-west-3" {
  count                 = contains(local.region_list, "eu-west-3") ? 1 : 0
  source                = "cloudposse/config/aws"
  version               = "0.17.0"
  create_sns_topic      = true
  create_iam_role       = var.org_primary_region == "eu-west-3"
  iam_role_arn          = var.org_primary_region == "eu-west-3" ? "" : local.iam_role_arn
  managed_rules         = {
    account-part-of-organizations = {
      description       = "Checks whether AWS account is part of AWS Organizations. The rule is NON_COMPLIANT if an AWS account is not part of AWS Organizations or AWS Organizations master account ID does not match rule parameter MasterAccountId.",
      identifier        = "ACCOUNT_PART_OF_ORGANIZATIONS",
      trigger_type      = "PERIODIC"
      enabled           = true
      input_parameters  = ""
      tags              = var.tags
    }
  }
  providers             = {
    aws = aws.eu-west-3
  }
  s3_bucket_id                      = var.log_s3_bucket
  s3_bucket_arn                     = "arn:aws:s3:::${var.log_s3_bucket}"
  s3_key_prefix                     = var.config_s3_key_prefix
  sns_encryption_key_id             = var.sns_encryption_key_id
  tags                              = var.tags
  global_resource_collector_region  = var.org_primary_region
}

#module "config_me-central-1" {
#  count                 = contains(local.region_list, "me-central-1") ? 1 : 0
#  source                = "cloudposse/config/aws"
#  version               = "0.17.0"
#  create_sns_topic      = true
#  create_iam_role       = var.org_primary_region == "me-central-1"
#  iam_role_arn          = var.org_primary_region == "me-central-1" ? "" : local.iam_role_arn
#  managed_rules         = {
#    account-part-of-organizations = {
#      description       = "Checks whether AWS account is part of AWS Organizations. The rule is NON_COMPLIANT if an AWS account is not part of AWS Organizations or AWS Organizations master account ID does not match rule parameter MasterAccountId.",
#      identifier        = "ACCOUNT_PART_OF_ORGANIZATIONS",
#      trigger_type      = "PERIODIC"
#      enabled           = true
#      input_parameters  = ""
#      tags              = var.tags
#    }
#  }
#  providers             = {
#    aws = aws.me-central-1
#  }
#  s3_bucket_id                      = var.log_s3_bucket
#  s3_bucket_arn                     = "arn:aws:s3:::${var.log_s3_bucket}"
#  s3_key_prefix                     = var.config_s3_key_prefix
#  sns_encryption_key_id             = var.sns_encryption_key_id
#  tags                              = var.tags
#  global_resource_collector_region  = var.org_primary_region
#}

#module "config_me-south-1" {
#  count                 = contains(local.region_list, "me-south-1") ? 1 : 0
#  source                = "cloudposse/config/aws"
#  version               = "0.17.0"
#  create_sns_topic      = true
#  create_iam_role       = var.org_primary_region == "me-south-1"
#  iam_role_arn          = var.org_primary_region == "me-south-1" ? "" : local.iam_role_arn
#  managed_rules         = {
#    account-part-of-organizations = {
#      description       = "Checks whether AWS account is part of AWS Organizations. The rule is NON_COMPLIANT if an AWS account is not part of AWS Organizations or AWS Organizations master account ID does not match rule parameter MasterAccountId.",
#      identifier        = "ACCOUNT_PART_OF_ORGANIZATIONS",
#      trigger_type      = "PERIODIC"
#      enabled           = true
#      input_parameters  = ""
#      tags              = var.tags
#    }
#  }
#  providers             = {
#    aws = aws.me-south-1
#  }
#  s3_bucket_id                      = var.log_s3_bucket
#  s3_bucket_arn                     = "arn:aws:s3:::${var.log_s3_bucket}"
#  s3_key_prefix                     = var.config_s3_key_prefix
#  sns_encryption_key_id             = var.sns_encryption_key_id
#  tags                              = var.tags
#  global_resource_collector_region  = var.org_primary_region
#}

module "config_sa-east-1" {
  count                 = contains(local.region_list, "sa-east-1") ? 1 : 0
  source                = "cloudposse/config/aws"
  version               = "0.17.0"
  create_sns_topic      = true
  create_iam_role       = var.org_primary_region == "sa-east-1"
  iam_role_arn          = var.org_primary_region == "sa-east-1" ? "" : local.iam_role_arn
  managed_rules         = {
    account-part-of-organizations = {
      description       = "Checks whether AWS account is part of AWS Organizations. The rule is NON_COMPLIANT if an AWS account is not part of AWS Organizations or AWS Organizations master account ID does not match rule parameter MasterAccountId.",
      identifier        = "ACCOUNT_PART_OF_ORGANIZATIONS",
      trigger_type      = "PERIODIC"
      enabled           = true
      input_parameters  = ""
      tags              = var.tags
    }
  }
  providers             = {
    aws = aws.sa-east-1
  }
  s3_bucket_id                      = var.log_s3_bucket
  s3_bucket_arn                     = "arn:aws:s3:::${var.log_s3_bucket}"
  s3_key_prefix                     = var.config_s3_key_prefix
  sns_encryption_key_id             = var.sns_encryption_key_id
  tags                              = var.tags
  global_resource_collector_region  = var.org_primary_region
}

module "config_us-east-1" {
  count                 = contains(local.region_list, "us-east-1") ? 1 : 0
  source                = "cloudposse/config/aws"
  version               = "0.17.0"
  create_sns_topic      = true
  create_iam_role       = var.org_primary_region == "us-east-1"
  iam_role_arn          = var.org_primary_region == "us-east-1" ? "" : local.iam_role_arn
  managed_rules         = {
    account-part-of-organizations = {
      description       = "Checks whether AWS account is part of AWS Organizations. The rule is NON_COMPLIANT if an AWS account is not part of AWS Organizations or AWS Organizations master account ID does not match rule parameter MasterAccountId.",
      identifier        = "ACCOUNT_PART_OF_ORGANIZATIONS",
      trigger_type      = "PERIODIC"
      enabled           = true
      input_parameters  = ""
      tags              = var.tags
    }
  }
  providers             = {
    aws = aws.us-east-1
  }
  s3_bucket_id                      = var.log_s3_bucket
  s3_bucket_arn                     = "arn:aws:s3:::${var.log_s3_bucket}"
  s3_key_prefix                     = var.config_s3_key_prefix
  sns_encryption_key_id             = var.sns_encryption_key_id
  tags                              = var.tags
  global_resource_collector_region  = var.org_primary_region
}

module "config_us-east-2" {
  count                 = contains(local.region_list, "us-east-2") ? 1 : 0
  source                = "cloudposse/config/aws"
  version               = "0.17.0"
  create_sns_topic      = true
  create_iam_role       = var.org_primary_region == "us-east-2"
  iam_role_arn          = var.org_primary_region == "us-east-2" ? "" : local.iam_role_arn
  managed_rules         = {
    account-part-of-organizations = {
      description       = "Checks whether AWS account is part of AWS Organizations. The rule is NON_COMPLIANT if an AWS account is not part of AWS Organizations or AWS Organizations master account ID does not match rule parameter MasterAccountId.",
      identifier        = "ACCOUNT_PART_OF_ORGANIZATIONS",
      trigger_type      = "PERIODIC"
      enabled           = true
      input_parameters  = ""
      tags              = var.tags
    }
  }
  providers             = {
    aws = aws.us-east-2
  }
  s3_bucket_id                      = var.log_s3_bucket
  s3_bucket_arn                     = "arn:aws:s3:::${var.log_s3_bucket}"
  s3_key_prefix                     = var.config_s3_key_prefix
  sns_encryption_key_id             = var.sns_encryption_key_id
  tags                              = var.tags
  global_resource_collector_region  = var.org_primary_region
}

module "config_us-west-1" {
  count                 = contains(local.region_list, "us-west-1") ? 1 : 0
  source                = "cloudposse/config/aws"
  version               = "0.17.0"
  create_sns_topic      = true
  create_iam_role       = var.org_primary_region == "us-west-1"
  iam_role_arn          = var.org_primary_region == "us-west-1" ? "" : local.iam_role_arn
  managed_rules         = {
    account-part-of-organizations = {
      description       = "Checks whether AWS account is part of AWS Organizations. The rule is NON_COMPLIANT if an AWS account is not part of AWS Organizations or AWS Organizations master account ID does not match rule parameter MasterAccountId.",
      identifier        = "ACCOUNT_PART_OF_ORGANIZATIONS",
      trigger_type      = "PERIODIC"
      enabled           = true
      input_parameters  = ""
      tags              = var.tags
    }
  }
  providers             = {
    aws = aws.us-west-1
  }
  s3_bucket_id                      = var.log_s3_bucket
  s3_bucket_arn                     = "arn:aws:s3:::${var.log_s3_bucket}"
  s3_key_prefix                     = var.config_s3_key_prefix
  sns_encryption_key_id             = var.sns_encryption_key_id
  tags                              = var.tags
  global_resource_collector_region  = var.org_primary_region
}

module "config_us-west-2" {
  count                 = contains(local.region_list, "us-west-2") ? 1 : 0
  source                = "cloudposse/config/aws"
  version               = "0.17.0"
  create_sns_topic      = true
  create_iam_role       = var.org_primary_region == "us-west-2"
  iam_role_arn          = var.org_primary_region == "us-west-2" ? "" : local.iam_role_arn
  managed_rules         = {
    account-part-of-organizations = {
      description       = "Checks whether AWS account is part of AWS Organizations. The rule is NON_COMPLIANT if an AWS account is not part of AWS Organizations or AWS Organizations master account ID does not match rule parameter MasterAccountId.",
      identifier        = "ACCOUNT_PART_OF_ORGANIZATIONS",
      trigger_type      = "PERIODIC"
      enabled           = true
      input_parameters  = ""
      tags              = var.tags
    }
  }
  providers             = {
    aws = aws.us-west-2
  }
  s3_bucket_id                      = var.log_s3_bucket
  s3_bucket_arn                     = "arn:aws:s3:::${var.log_s3_bucket}"
  s3_key_prefix                     = var.config_s3_key_prefix
  sns_encryption_key_id             = var.sns_encryption_key_id
  tags                              = var.tags
  global_resource_collector_region  = var.org_primary_region
}

