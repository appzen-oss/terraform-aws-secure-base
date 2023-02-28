# Region list:
## aws ec2 describe-regions --all-regions --filters Name=opt-in-status,Values=not-opted-in,opt-in-not-required --query Regions[].RegionName[]
## data.aws_regions.enabled.names

#module "guardduty-af-south-1" {
#  source             = "./modules/guardduty"
#  count              = var.enable_guardduty ? 1 : 0
#  depends_on         = [aws_organizations_organization.self, module.guardduty-us-east-1]
#  enable             = var.enable_guardduty
#  org_account_active = var.org_account_active
#  org_primary_region = var.org_primary_region
#  providers = {
#    aws = aws.af-south-1
#  }
#  account_type                      = var.account_type
#  security_administrator_account_id = var.security_administrator_account_id
#  tags               = var.tags
#}

#module "guardduty-ap-east-1" {
#  source             = "./modules/guardduty"
#  count              = var.enable_guardduty ? 1 : 0
#  depends_on         = [aws_organizations_organization.self, module.guardduty-us-east-1]
#  enable             = var.enable_guardduty
#  org_account_active = var.org_account_active
#  org_primary_region = var.org_primary_region
#  providers = {
#    aws = aws.ap-east-1
#  }
#  account_type                      = var.account_type
#  security_administrator_account_id = var.security_administrator_account_id
#  tags               = var.tags
#}

module "guardduty-ap-northeast-1" {
  source              = "./modules/guardduty"
  count               = var.enable_guardduty ? 1 : 0
  depends_on          = [aws_organizations_organization.self, module.guardduty-us-east-1]
  enable              = var.enable_guardduty && var.account_type == "administrator"
  org_account_active  = var.org_account_active
  org_primary_region  = var.org_primary_region
  providers = {
    aws = aws.ap-northeast-1
  }
  account_type                      = var.account_type
  security_administrator_account_id = var.security_administrator_account_id
  tags                = var.tags
}

module "guardduty-ap-northeast-2" {
  source              = "./modules/guardduty"
  count               = var.enable_guardduty ? 1 : 0
  depends_on          = [aws_organizations_organization.self, module.guardduty-us-east-1]
  enable              = var.enable_guardduty && var.account_type == "administrator"
  org_account_active  = var.org_account_active
  org_primary_region  = var.org_primary_region
  providers = {
    aws = aws.ap-northeast-2
  }
  account_type                      = var.account_type
  security_administrator_account_id = var.security_administrator_account_id
  tags                = var.tags
}

module "guardduty-ap-northeast-3" {
  source              = "./modules/guardduty"
  count               = var.enable_guardduty ? 1 : 0
  depends_on          = [aws_organizations_organization.self, module.guardduty-us-east-1]
  enable              = var.enable_guardduty && var.account_type == "administrator"
  org_account_active  = var.org_account_active
  org_primary_region  = var.org_primary_region
  providers = {
    aws = aws.ap-northeast-3
  }
  account_type                      = var.account_type
  security_administrator_account_id = var.security_administrator_account_id
  tags                = var.tags
}

module "guardduty-ap-south-1" {
  source              = "./modules/guardduty"
  count               = var.enable_guardduty ? 1 : 0
  depends_on          = [aws_organizations_organization.self, module.guardduty-us-east-1]
  enable              = var.enable_guardduty && var.account_type == "administrator"
  org_account_active  = var.org_account_active
  org_primary_region  = var.org_primary_region
  providers = {
    aws = aws.ap-south-1
  }
  account_type                      = var.account_type
  security_administrator_account_id = var.security_administrator_account_id
  tags                = var.tags
}

#module "guardduty-ap-south-2" {
#  source             = "./modules/guardduty"
#  count              = var.enable_guardduty ? 1 : 0
#  depends_on         = [aws_organizations_organization.self, module.guardduty-us-east-1]
#  enable             = var.enable_guardduty
#  org_account_active = var.org_account_active
#  org_primary_region = var.org_primary_region
#  providers = {
#    aws = aws.ap-south-2
#  }
#  account_type                      = var.account_type
#  security_administrator_account_id = var.security_administrator_account_id
#  tags               = var.tags
#}

module "guardduty-ap-southeast-1" {
  source              = "./modules/guardduty"
  count               = var.enable_guardduty ? 1 : 0
  depends_on          = [aws_organizations_organization.self, module.guardduty-us-east-1]
  enable              = var.enable_guardduty && var.account_type == "administrator"
  org_account_active  = var.org_account_active
  org_primary_region  = var.org_primary_region
  providers = {
    aws = aws.ap-southeast-1
  }
  account_type                      = var.account_type
  security_administrator_account_id = var.security_administrator_account_id
  tags                = var.tags
}

module "guardduty-ap-southeast-2" {
  source              = "./modules/guardduty"
  count               = var.enable_guardduty ? 1 : 0
  depends_on          = [aws_organizations_organization.self, module.guardduty-us-east-1]
  enable              = var.enable_guardduty && var.account_type == "administrator"
  org_account_active  = var.org_account_active
  org_primary_region  = var.org_primary_region
  providers = {
    aws = aws.ap-southeast-2
  }
  account_type                      = var.account_type
  security_administrator_account_id = var.security_administrator_account_id
  tags                = var.tags
}

#module "guardduty-ap-southeast-3" {
#  source             = "./modules/guardduty"
#  count              = var.enable_guardduty ? 1 : 0
#  depends_on         = [aws_organizations_organization.self, module.guardduty-us-east-1]
#  enable             = var.enable_guardduty
#  org_account_active = var.org_account_active
#  org_primary_region = var.org_primary_region
#  providers = {
#    aws = aws.ap-southeast-3
#  }
#  account_type                      = var.account_type
#  security_administrator_account_id = var.security_administrator_account_id
#  tags               = var.tags
#}

#module "guardduty-ap-southeast-4" {
#  source             = "./modules/guardduty"
#  count              = var.enable_guardduty ? 1 : 0
#  depends_on         = [aws_organizations_organization.self, module.guardduty-us-east-1]
#  enable             = var.enable_guardduty
#  org_account_active = var.org_account_active
#  org_primary_region = var.org_primary_region
#  providers = {
#    aws = aws.ap-southeast-4
#  }
#  account_type                      = var.account_type
#  security_administrator_account_id = var.security_administrator_account_id
#  tags               = var.tags
#}

module "guardduty-ca-central-1" {
  source              = "./modules/guardduty"
  count               = var.enable_guardduty ? 1 : 0
  depends_on          = [aws_organizations_organization.self, module.guardduty-us-east-1]
  enable              = var.enable_guardduty && var.account_type == "administrator"
  org_account_active  = var.org_account_active
  org_primary_region  = var.org_primary_region
  providers = {
    aws = aws.ca-central-1
  }
  account_type                      = var.account_type
  security_administrator_account_id = var.security_administrator_account_id
  tags                = var.tags
}

module "guardduty-eu-central-1" {
  source              = "./modules/guardduty"
  count               = var.enable_guardduty ? 1 : 0
  depends_on          = [aws_organizations_organization.self, module.guardduty-us-east-1]
  enable              = var.enable_guardduty && var.account_type == "administrator"
  org_account_active  = var.org_account_active
  org_primary_region  = var.org_primary_region
  providers = {
    aws = aws.eu-central-1
  }
  account_type                      = var.account_type
  security_administrator_account_id = var.security_administrator_account_id
  tags                = var.tags
}

#module "guardduty-eu-central-2" {
#  source             = "./modules/guardduty"
#  count              = var.enable_guardduty ? 1 : 0
#  depends_on         = [aws_organizations_organization.self, module.guardduty-us-east-1]
#  enable             = var.enable_guardduty
#  org_account_active = var.org_account_active
#  org_primary_region = var.org_primary_region
#  providers = {
#    aws = aws.eu-central-2
#  }
#  account_type                      = var.account_type
#  security_administrator_account_id = var.security_administrator_account_id
#  tags               = var.tags
#}

module "guardduty-eu-north-1" {
  source              = "./modules/guardduty"
  count               = var.enable_guardduty ? 1 : 0
  depends_on          = [aws_organizations_organization.self, module.guardduty-us-east-1]
  enable              = var.enable_guardduty && var.account_type == "administrator"
  org_account_active  = var.org_account_active
  org_primary_region  = var.org_primary_region
  providers = {
    aws = aws.eu-north-1
  }
  account_type                      = var.account_type
  security_administrator_account_id = var.security_administrator_account_id
  tags                = var.tags
}

#module "guardduty-eu-south-1" {
#  source             = "./modules/guardduty"
#  count              = var.enable_guardduty ? 1 : 0
#  depends_on         = [aws_organizations_organization.self, module.guardduty-us-east-1]
#  enable             = var.enable_guardduty
#  org_account_active = var.org_account_active
#  org_primary_region = var.org_primary_region
#  providers = {
#    aws = aws.eu-south-1
#  }
#  account_type                      = var.account_type
#  security_administrator_account_id = var.security_administrator_account_id
#  tags               = var.tags
#}

#module "guardduty-eu-south-2" {
#  source             = "./modules/guardduty"
#  count              = var.enable_guardduty ? 1 : 0
#  depends_on         = [aws_organizations_organization.self, module.guardduty-us-east-1]
#  enable             = var.enable_guardduty
#  org_account_active = var.org_account_active
#  org_primary_region = var.org_primary_region
#  providers = {
#    aws = aws.eu-south-2
#  }
#  account_type                      = var.account_type
#  security_administrator_account_id = var.security_administrator_account_id
#  tags               = var.tags
#}

module "guardduty-eu-west-1" {
  source              = "./modules/guardduty"
  count               = var.enable_guardduty ? 1 : 0
  depends_on          = [aws_organizations_organization.self, module.guardduty-us-east-1]
  enable              = var.enable_guardduty && var.account_type == "administrator"
  org_account_active  = var.org_account_active
  org_primary_region  = var.org_primary_region
  providers = {
    aws = aws.eu-west-1
  }
  account_type                      = var.account_type
  security_administrator_account_id = var.security_administrator_account_id
  tags                = var.tags
}

module "guardduty-eu-west-2" {
  source              = "./modules/guardduty"
  count               = var.enable_guardduty ? 1 : 0
  depends_on          = [aws_organizations_organization.self, module.guardduty-us-east-1]
  enable              = var.enable_guardduty && var.account_type == "administrator"
  org_account_active  = var.org_account_active
  org_primary_region  = var.org_primary_region
  providers = {
    aws = aws.eu-west-2
  }
  account_type                      = var.account_type
  security_administrator_account_id = var.security_administrator_account_id
  tags                = var.tags
}

module "guardduty-eu-west-3" {
  source              = "./modules/guardduty"
  count               = var.enable_guardduty ? 1 : 0
  depends_on          = [aws_organizations_organization.self, module.guardduty-us-east-1]
  enable              = var.enable_guardduty && var.account_type == "administrator"
  org_account_active  = var.org_account_active
  org_primary_region  = var.org_primary_region
  providers = {
    aws = aws.eu-west-3
  }
  account_type                      = var.account_type
  security_administrator_account_id = var.security_administrator_account_id
  tags                = var.tags
}

#module "guardduty-me-central-1" {
#  source             = "./modules/guardduty"
#  count              = var.enable_guardduty ? 1 : 0
#  depends_on         = [aws_organizations_organization.self, module.guardduty-us-east-1]
#  enable             = var.enable_guardduty
#  org_account_active = var.org_account_active
#  org_primary_region = var.org_primary_region
#  providers = {
#    aws = aws.me-central-1
#  }
#  account_type                      = var.account_type
#  security_administrator_account_id = var.security_administrator_account_id
#  tags               = var.tags
#}

#module "guardduty-me-south-1" {
#  source             = "./modules/guardduty"
#  count              = var.enable_guardduty ? 1 : 0
#  depends_on         = [aws_organizations_organization.self, module.guardduty-us-east-1]
#  enable             = var.enable_guardduty
#  org_account_active = var.org_account_active
#  org_primary_region = var.org_primary_region
#  providers = {
#    aws = aws.me-south-1
#  }
#  account_type                      = var.account_type
#  security_administrator_account_id = var.security_administrator_account_id
#  tags               = var.tags
#}

module "guardduty-sa-east-1" {
  source              = "./modules/guardduty"
  count               = var.enable_guardduty ? 1 : 0
  depends_on          = [aws_organizations_organization.self, module.guardduty-us-east-1]
  enable              = var.enable_guardduty && var.account_type == "administrator"
  org_account_active  = var.org_account_active
  org_primary_region  = var.org_primary_region
  providers = {
    aws = aws.sa-east-1
  }
  account_type                      = var.account_type
  security_administrator_account_id = var.security_administrator_account_id
  tags                = var.tags
}

module "guardduty-us-east-1" {
  source              = "./modules/guardduty"
  count               = var.enable_guardduty ? 1 : 0
  depends_on          = [aws_organizations_organization.self]
  enable              = var.enable_guardduty && var.account_type == "administrator"
  org_account_active  = var.org_account_active
  org_primary_region  = var.org_primary_region
  providers = {
    aws = aws.us-east-1
  }
  account_type                      = var.account_type
  security_administrator_account_id = var.security_administrator_account_id
  tags                = var.tags
}

module "guardduty-us-east-2" {
  source              = "./modules/guardduty"
  count               = var.enable_guardduty ? 1 : 0
  depends_on          = [aws_organizations_organization.self, module.guardduty-us-east-1]
  enable              = var.enable_guardduty && var.account_type == "administrator"
  org_account_active  = var.org_account_active
  org_primary_region  = var.org_primary_region
  providers = {
    aws = aws.us-east-2
  }
  account_type                      = var.account_type
  security_administrator_account_id = var.security_administrator_account_id
  tags                = var.tags
}

module "guardduty-us-west-1" {
  source              = "./modules/guardduty"
  count               = var.enable_guardduty ? 1 : 0
  depends_on          = [aws_organizations_organization.self, module.guardduty-us-east-1]
  enable              = var.enable_guardduty && var.account_type == "administrator"
  org_account_active  = var.org_account_active
  org_primary_region  = var.org_primary_region
  providers = {
    aws = aws.us-west-1
  }
  account_type                      = var.account_type
  security_administrator_account_id = var.security_administrator_account_id
  tags                = var.tags
}

module "guardduty-us-west-2" {
  source              = "./modules/guardduty"
  count               = var.enable_guardduty ? 1 : 0
  depends_on          = [aws_organizations_organization.self, module.guardduty-us-east-1]
  enable              = var.enable_guardduty && var.account_type == "administrator"
  org_account_active  = var.org_account_active
  org_primary_region  = var.org_primary_region
  providers = {
    aws = aws.us-west-2
  }
  account_type                      = var.account_type
  security_administrator_account_id = var.security_administrator_account_id
  tags                = var.tags
}
