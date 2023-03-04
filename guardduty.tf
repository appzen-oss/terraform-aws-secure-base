# Region list:
## aws ec2 describe-regions --all-regions --filters Name=opt-in-status,Values=not-opted-in,opt-in-not-required --query Regions[].RegionName[]
## data.aws_regions.enabled.names

#module "guardduty-af-south-1" {
#  source             = "./modules/guardduty"
#  count              = var.enable_guardduty ? 1 : 0
#  depends_on         = [aws_organizations_organization.self, module.guardduty-us-east-1]
#  enable             = var.enable_guardduty
#  org_account_active_map = var.org_account_active_map
#  org_primary_region = var.org_primary_region
#  providers = {
#    aws = aws.af-south-1
#  }
#  account_type                      = var.account_type
#  security_administrator_account_id = var.security_administrator_account_id
#  tags               = var.tags
#}
#resource "aws_guardduty_organization_admin_account" "guardduty-af-south-1" {
#  count             = var.enable_guardduty && var.account_type == "master" ? 1 : 0
#  admin_account_id  = var.security_administrator_account_id
#  provider          = aws.af-south-1
#  depends_on        = [aws_organizations_organization.self]
#}

#module "guardduty-ap-east-1" {
#  source             = "./modules/guardduty"
#  count              = var.enable_guardduty ? 1 : 0
#  depends_on         = [aws_organizations_organization.self, module.guardduty-us-east-1]
#  enable             = var.enable_guardduty
#  org_account_active_map = var.org_account_active_map
#  org_primary_region = var.org_primary_region
#  providers = {
#    aws = aws.ap-east-1
#  }
#  account_type                      = var.account_type
#  security_administrator_account_id = var.security_administrator_account_id
#  tags               = var.tags
#}
#resource "aws_guardduty_organization_admin_account" "guardduty-ap-east-1" {
#  count             = var.enable_guardduty && var.account_type == "master" ? 1 : 0
#  admin_account_id  = var.security_administrator_account_id
#  provider          = aws.ap-east-1
#  depends_on        = [aws_organizations_organization.self]
#}

module "guardduty-ap-northeast-1" {
  source              = "./modules/guardduty"
  count               = var.enable_guardduty && var.account_type == "administrator" ? 1 : 0
  depends_on          = [aws_organizations_organization.self, module.guardduty-us-east-1]
  enable              = var.enable_guardduty && var.account_type == "administrator"
  org_account_active_map  = var.org_account_active_map
  org_primary_region  = var.org_primary_region
  providers = {
    aws = aws.ap-northeast-1
  }
  account_type                      = var.account_type
  security_administrator_account_id = var.security_administrator_account_id
  tags                = var.tags
}
resource "aws_guardduty_organization_admin_account" "guardduty-ap-northeast-1" {
  count             = var.enable_guardduty && var.account_type == "master" ? 1 : 0
  admin_account_id  = var.security_administrator_account_id
  provider          = aws.ap-northeast-1
  depends_on        = [aws_organizations_organization.self]
}

module "guardduty-ap-northeast-2" {
  source              = "./modules/guardduty"
  count               = var.enable_guardduty && var.account_type == "administrator" ? 1 : 0
  depends_on          = [aws_organizations_organization.self, module.guardduty-us-east-1]
  enable              = var.enable_guardduty && var.account_type == "administrator"
  org_account_active_map  = var.org_account_active_map
  org_primary_region  = var.org_primary_region
  providers = {
    aws = aws.ap-northeast-2
  }
  account_type                      = var.account_type
  security_administrator_account_id = var.security_administrator_account_id
  tags                = var.tags
}
resource "aws_guardduty_organization_admin_account" "guardduty-ap-northeast-2" {
  count             = var.enable_guardduty && var.account_type == "master" ? 1 : 0
  admin_account_id  = var.security_administrator_account_id
  provider          = aws.ap-northeast-2
  depends_on        = [aws_organizations_organization.self]
}

module "guardduty-ap-northeast-3" {
  source              = "./modules/guardduty"
  count               = var.enable_guardduty && var.account_type == "administrator" ? 1 : 0
  depends_on          = [aws_organizations_organization.self, module.guardduty-us-east-1]
  enable              = var.enable_guardduty && var.account_type == "administrator"
  org_account_active_map  = var.org_account_active_map
  org_primary_region  = var.org_primary_region
  providers = {
    aws = aws.ap-northeast-3
  }
  account_type                      = var.account_type
  security_administrator_account_id = var.security_administrator_account_id
  tags                = var.tags
}
resource "aws_guardduty_organization_admin_account" "guardduty-ap-northeast-3" {
  count             = var.enable_guardduty && var.account_type == "master" ? 1 : 0
  admin_account_id  = var.security_administrator_account_id
  provider          = aws.ap-northeast-3
  depends_on        = [aws_organizations_organization.self]
}

module "guardduty-ap-south-1" {
  source              = "./modules/guardduty"
  count               = var.enable_guardduty && var.account_type == "administrator" ? 1 : 0
  depends_on          = [aws_organizations_organization.self, module.guardduty-us-east-1]
  enable              = var.enable_guardduty && var.account_type == "administrator"
  org_account_active_map  = var.org_account_active_map
  org_primary_region  = var.org_primary_region
  providers = {
    aws = aws.ap-south-1
  }
  account_type                      = var.account_type
  security_administrator_account_id = var.security_administrator_account_id
  tags                = var.tags
}
resource "aws_guardduty_organization_admin_account" "guardduty-ap-south-1" {
  count             = var.enable_guardduty && var.account_type == "master" ? 1 : 0
  admin_account_id  = var.security_administrator_account_id
  provider          = aws.ap-south-1
  depends_on        = [aws_organizations_organization.self]
}

#module "guardduty-ap-south-2" {
#  source             = "./modules/guardduty"
#  count              = var.enable_guardduty ? 1 : 0
#  depends_on         = [aws_organizations_organization.self, module.guardduty-us-east-1]
#  enable             = var.enable_guardduty
#  org_account_active_map = var.org_account_active_map
#  org_primary_region = var.org_primary_region
#  providers = {
#    aws = aws.ap-south-2
#  }
#  account_type                      = var.account_type
#  security_administrator_account_id = var.security_administrator_account_id
#  tags               = var.tags
#}
#resource "aws_guardduty_organization_admin_account" "guardduty-af-south-2" {
#  count             = var.enable_guardduty && var.account_type == "master" ? 1 : 0
#  admin_account_id  = var.security_administrator_account_id
#  provider          = aws.af-south-2
#  depends_on        = [aws_organizations_organization.self]
#}

module "guardduty-ap-southeast-1" {
  source              = "./modules/guardduty"
  count               = var.enable_guardduty && var.account_type == "administrator" ? 1 : 0
  depends_on          = [aws_organizations_organization.self, module.guardduty-us-east-1]
  enable              = var.enable_guardduty && var.account_type == "administrator"
  org_account_active_map  = var.org_account_active_map
  org_primary_region  = var.org_primary_region
  providers = {
    aws = aws.ap-southeast-1
  }
  account_type                      = var.account_type
  security_administrator_account_id = var.security_administrator_account_id
  tags                = var.tags
}
resource "aws_guardduty_organization_admin_account" "guardduty-ap-southeast-1" {
  count             = var.enable_guardduty && var.account_type == "master" ? 1 : 0
  admin_account_id  = var.security_administrator_account_id
  provider          = aws.ap-southeast-1
  depends_on        = [aws_organizations_organization.self]
}

module "guardduty-ap-southeast-2" {
  source              = "./modules/guardduty"
  count               = var.enable_guardduty && var.account_type == "administrator" ? 1 : 0
  depends_on          = [aws_organizations_organization.self, module.guardduty-us-east-1]
  enable              = var.enable_guardduty && var.account_type == "administrator"
  org_account_active_map  = var.org_account_active_map
  org_primary_region  = var.org_primary_region
  providers = {
    aws = aws.ap-southeast-2
  }
  account_type                      = var.account_type
  security_administrator_account_id = var.security_administrator_account_id
  tags                = var.tags
}
resource "aws_guardduty_organization_admin_account" "guardduty-ap-southeast-2" {
  count             = var.enable_guardduty && var.account_type == "master" ? 1 : 0
  admin_account_id  = var.security_administrator_account_id
  provider          = aws.ap-southeast-2
  depends_on        = [aws_organizations_organization.self]
}

#module "guardduty-ap-southeast-3" {
#  source             = "./modules/guardduty"
#  count              = var.enable_guardduty ? 1 : 0
#  depends_on         = [aws_organizations_organization.self, module.guardduty-us-east-1]
#  enable             = var.enable_guardduty
#  org_account_active_map = var.org_account_active_map
#  org_primary_region = var.org_primary_region
#  providers = {
#    aws = aws.ap-southeast-3
#  }
#  account_type                      = var.account_type
#  security_administrator_account_id = var.security_administrator_account_id
#  tags               = var.tags
#}
#resource "aws_guardduty_organization_admin_account" "guardduty-ap-southeast-3" {
#  count             = var.enable_guardduty && var.account_type == "master" ? 1 : 0
#  admin_account_id  = var.security_administrator_account_id
#  provider          = aws.ap-southeast-3
#  depends_on        = [aws_organizations_organization.self]
#}

#module "guardduty-ap-southeast-4" {
#  source             = "./modules/guardduty"
#  count              = var.enable_guardduty ? 1 : 0
#  depends_on         = [aws_organizations_organization.self, module.guardduty-us-east-1]
#  enable             = var.enable_guardduty
#  org_account_active_map = var.org_account_active_map
#  org_primary_region = var.org_primary_region
#  providers = {
#    aws = aws.ap-southeast-4
#  }
#  account_type                      = var.account_type
#  security_administrator_account_id = var.security_administrator_account_id
#  tags               = var.tags
#}
#resource "aws_guardduty_organization_admin_account" "guardduty-ap-southeast-4" {
#  count             = var.enable_guardduty && var.account_type == "master" ? 1 : 0
#  admin_account_id  = var.security_administrator_account_id
#  provider          = aws.ap-southeast-4
#  depends_on        = [aws_organizations_organization.self]
#}

module "guardduty-ca-central-1" {
  source              = "./modules/guardduty"
  count               = var.enable_guardduty && var.account_type == "administrator" ? 1 : 0
  depends_on          = [aws_organizations_organization.self, module.guardduty-us-east-1]
  enable              = var.enable_guardduty && var.account_type == "administrator"
  org_account_active_map  = var.org_account_active_map
  org_primary_region  = var.org_primary_region
  providers = {
    aws = aws.ca-central-1
  }
  account_type                      = var.account_type
  security_administrator_account_id = var.security_administrator_account_id
  tags                = var.tags
}
resource "aws_guardduty_organization_admin_account" "guardduty-ca-central-1" {
  count             = var.enable_guardduty && var.account_type == "master" ? 1 : 0
  admin_account_id  = var.security_administrator_account_id
  provider          = aws.ca-central-1
  depends_on        = [aws_organizations_organization.self]
}

module "guardduty-eu-central-1" {
  source              = "./modules/guardduty"
  count               = var.enable_guardduty && var.account_type == "administrator" ? 1 : 0
  depends_on          = [aws_organizations_organization.self, module.guardduty-us-east-1]
  enable              = var.enable_guardduty && var.account_type == "administrator"
  org_account_active_map  = var.org_account_active_map
  org_primary_region  = var.org_primary_region
  providers = {
    aws = aws.eu-central-1
  }
  account_type                      = var.account_type
  security_administrator_account_id = var.security_administrator_account_id
  tags                = var.tags
}
resource "aws_guardduty_organization_admin_account" "guardduty-eu-central-1" {
  count             = var.enable_guardduty && var.account_type == "master" ? 1 : 0
  admin_account_id  = var.security_administrator_account_id
  provider          = aws.eu-central-1
  depends_on        = [aws_organizations_organization.self]
}

#module "guardduty-eu-central-2" {
#  source             = "./modules/guardduty"
#  count              = var.enable_guardduty ? 1 : 0
#  depends_on         = [aws_organizations_organization.self, module.guardduty-us-east-1]
#  enable             = var.enable_guardduty
#  org_account_active_map = var.org_account_active_map
#  org_primary_region = var.org_primary_region
#  providers = {
#    aws = aws.eu-central-2
#  }
#  account_type                      = var.account_type
#  security_administrator_account_id = var.security_administrator_account_id
#  tags               = var.tags
#}
#resource "aws_guardduty_organization_admin_account" "guardduty-eu-central-2" {
#  count             = var.enable_guardduty && var.account_type == "master" ? 1 : 0
#  admin_account_id  = var.security_administrator_account_id
#  provider          = aws.eu-central-2
#  depends_on        = [aws_organizations_organization.self]
#}

module "guardduty-eu-north-1" {
  source              = "./modules/guardduty"
  count               = var.enable_guardduty && var.account_type == "administrator" ? 1 : 0
  depends_on          = [aws_organizations_organization.self, module.guardduty-us-east-1]
  enable              = var.enable_guardduty && var.account_type == "administrator"
  org_account_active_map  = var.org_account_active_map
  org_primary_region  = var.org_primary_region
  providers = {
    aws = aws.eu-north-1
  }
  account_type                      = var.account_type
  security_administrator_account_id = var.security_administrator_account_id
  tags                = var.tags
}
resource "aws_guardduty_organization_admin_account" "guardduty-eu-north-1" {
  count             = var.enable_guardduty && var.account_type == "master" ? 1 : 0
  admin_account_id  = var.security_administrator_account_id
  provider          = aws.eu-north-1
  depends_on        = [aws_organizations_organization.self]
}

#module "guardduty-eu-south-1" {
#  source             = "./modules/guardduty"
#  count              = var.enable_guardduty ? 1 : 0
#  depends_on         = [aws_organizations_organization.self, module.guardduty-us-east-1]
#  enable             = var.enable_guardduty
#  org_account_active_map = var.org_account_active_map
#  org_primary_region = var.org_primary_region
#  providers = {
#    aws = aws.eu-south-1
#  }
#  account_type                      = var.account_type
#  security_administrator_account_id = var.security_administrator_account_id
#  tags               = var.tags
#}
#resource "aws_guardduty_organization_admin_account" "guardduty-eu-south-1" {
#  count             = var.enable_guardduty && var.account_type == "master" ? 1 : 0
#  admin_account_id  = var.security_administrator_account_id
#  provider          = aws.eu-south-1
#  depends_on        = [aws_organizations_organization.self]
#}

#module "guardduty-eu-south-2" {
#  source             = "./modules/guardduty"
#  count              = var.enable_guardduty ? 1 : 0
#  depends_on         = [aws_organizations_organization.self, module.guardduty-us-east-1]
#  enable             = var.enable_guardduty
#  org_account_active_map = var.org_account_active_map
#  org_primary_region = var.org_primary_region
#  providers = {
#    aws = aws.eu-south-2
#  }
#  account_type                      = var.account_type
#  security_administrator_account_id = var.security_administrator_account_id
#  tags               = var.tags
#}
#resource "aws_guardduty_organization_admin_account" "guardduty-eu-south-2" {
#  count             = var.enable_guardduty && var.account_type == "master" ? 1 : 0
#  admin_account_id  = var.security_administrator_account_id
#  provider          = aws.eu-south-2
#  depends_on        = [aws_organizations_organization.self]
#}

module "guardduty-eu-west-1" {
  source              = "./modules/guardduty"
  count               = var.enable_guardduty && var.account_type == "administrator" ? 1 : 0
  depends_on          = [aws_organizations_organization.self, module.guardduty-us-east-1]
  enable              = var.enable_guardduty && var.account_type == "administrator"
  org_account_active_map  = var.org_account_active_map
  org_primary_region  = var.org_primary_region
  providers = {
    aws = aws.eu-west-1
  }
  account_type                      = var.account_type
  security_administrator_account_id = var.security_administrator_account_id
  tags                = var.tags
}
resource "aws_guardduty_organization_admin_account" "guardduty-eu-west-1" {
  count             = var.enable_guardduty && var.account_type == "master" ? 1 : 0
  admin_account_id  = var.security_administrator_account_id
  provider          = aws.eu-west-1
  depends_on        = [aws_organizations_organization.self]
}

module "guardduty-eu-west-2" {
  source              = "./modules/guardduty"
  count               = var.enable_guardduty && var.account_type == "administrator" ? 1 : 0
  depends_on          = [aws_organizations_organization.self, module.guardduty-us-east-1]
  enable              = var.enable_guardduty && var.account_type == "administrator"
  org_account_active_map  = var.org_account_active_map
  org_primary_region  = var.org_primary_region
  providers = {
    aws = aws.eu-west-2
  }
  account_type                      = var.account_type
  security_administrator_account_id = var.security_administrator_account_id
  tags                = var.tags
}
resource "aws_guardduty_organization_admin_account" "guardduty-eu-west-2" {
  count             = var.enable_guardduty && var.account_type == "master" ? 1 : 0
  admin_account_id  = var.security_administrator_account_id
  provider          = aws.eu-west-2
  depends_on        = [aws_organizations_organization.self]
}

module "guardduty-eu-west-3" {
  source              = "./modules/guardduty"
  count               = var.enable_guardduty && var.account_type == "administrator" ? 1 : 0
  depends_on          = [aws_organizations_organization.self, module.guardduty-us-east-1]
  enable              = var.enable_guardduty && var.account_type == "administrator"
  org_account_active_map  = var.org_account_active_map
  org_primary_region  = var.org_primary_region
  providers = {
    aws = aws.eu-west-3
  }
  account_type                      = var.account_type
  security_administrator_account_id = var.security_administrator_account_id
  tags                = var.tags
}
resource "aws_guardduty_organization_admin_account" "guardduty-eu-west-3" {
  count             = var.enable_guardduty && var.account_type == "master" ? 1 : 0
  admin_account_id  = var.security_administrator_account_id
  provider          = aws.eu-west-3
  depends_on        = [aws_organizations_organization.self]
}

#module "guardduty-me-central-1" {
#  source             = "./modules/guardduty"
#  count              = var.enable_guardduty ? 1 : 0
#  depends_on         = [aws_organizations_organization.self, module.guardduty-us-east-1]
#  enable             = var.enable_guardduty
#  org_account_active_map = var.org_account_active_map
#  org_primary_region = var.org_primary_region
#  providers = {
#    aws = aws.me-central-1
#  }
#  account_type                      = var.account_type
#  security_administrator_account_id = var.security_administrator_account_id
#  tags               = var.tags
#}
#resource "aws_guardduty_organization_admin_account" "guardduty-me-central-1" {
#  count             = var.enable_guardduty && var.account_type == "master" ? 1 : 0
#  admin_account_id  = var.security_administrator_account_id
#  provider          = aws.me-central-1
#  depends_on        = [aws_organizations_organization.self]
#}

#module "guardduty-me-south-1" {
#  source             = "./modules/guardduty"
#  count              = var.enable_guardduty ? 1 : 0
#  depends_on         = [aws_organizations_organization.self, module.guardduty-us-east-1]
#  enable             = var.enable_guardduty
#  org_account_active_map = var.org_account_active_map
#  org_primary_region = var.org_primary_region
#  providers = {
#    aws = aws.me-south-1
#  }
#  account_type                      = var.account_type
#  security_administrator_account_id = var.security_administrator_account_id
#  tags               = var.tags
#}
#resource "aws_guardduty_organization_admin_account" "guardduty-me-south-1" {
#  count             = var.enable_guardduty && var.account_type == "master" ? 1 : 0
#  admin_account_id  = var.security_administrator_account_id
#  provider          = aws.me-south-1
#  depends_on        = [aws_organizations_organization.self]
#}

module "guardduty-sa-east-1" {
  source              = "./modules/guardduty"
  count               = var.enable_guardduty && var.account_type == "administrator" ? 1 : 0
  depends_on          = [aws_organizations_organization.self, module.guardduty-us-east-1]
  enable              = var.enable_guardduty && var.account_type == "administrator"
  org_account_active_map  = var.org_account_active_map
  org_primary_region  = var.org_primary_region
  providers = {
    aws = aws.sa-east-1
  }
  account_type                      = var.account_type
  security_administrator_account_id = var.security_administrator_account_id
  tags                = var.tags
}
resource "aws_guardduty_organization_admin_account" "guardduty-sa-east-1" {
  count             = var.enable_guardduty && var.account_type == "master" ? 1 : 0
  admin_account_id  = var.security_administrator_account_id
  provider          = aws.sa-east-1
  depends_on        = [aws_organizations_organization.self]
}

module "guardduty-us-east-1" {
  source              = "./modules/guardduty"
  count               = var.enable_guardduty && var.account_type == "administrator" ? 1 : 0
  depends_on          = [aws_organizations_organization.self]
  enable              = var.enable_guardduty && var.account_type == "administrator"
  org_account_active_map  = var.org_account_active_map
  org_primary_region  = var.org_primary_region
  providers = {
    aws = aws.us-east-1
  }
  account_type                      = var.account_type
  security_administrator_account_id = var.security_administrator_account_id
  tags                = var.tags
}
resource "aws_guardduty_organization_admin_account" "guardduty-us-east-1" {
  count             = var.enable_guardduty && var.account_type == "master" ? 1 : 0
  admin_account_id  = var.security_administrator_account_id
  provider          = aws.us-east-1
  depends_on        = [aws_organizations_organization.self]
}

module "guardduty-us-east-2" {
  source              = "./modules/guardduty"
  count               = var.enable_guardduty && var.account_type == "administrator" ? 1 : 0
  depends_on          = [aws_organizations_organization.self, module.guardduty-us-east-1]
  enable              = var.enable_guardduty && var.account_type == "administrator"
  org_account_active_map  = var.org_account_active_map
  org_primary_region  = var.org_primary_region
  providers = {
    aws = aws.us-east-2
  }
  account_type                      = var.account_type
  security_administrator_account_id = var.security_administrator_account_id
  tags                = var.tags
}
resource "aws_guardduty_organization_admin_account" "guardduty-us-east-2" {
  count             = var.enable_guardduty && var.account_type == "master" ? 1 : 0
  admin_account_id  = var.security_administrator_account_id
  provider          = aws.us-east-2
  depends_on        = [aws_organizations_organization.self]
}

module "guardduty-us-west-1" {
  source              = "./modules/guardduty"
  count               = var.enable_guardduty && var.account_type == "administrator" ? 1 : 0
  depends_on          = [aws_organizations_organization.self, module.guardduty-us-east-1]
  enable              = var.enable_guardduty && var.account_type == "administrator"
  org_account_active_map  = var.org_account_active_map
  org_primary_region  = var.org_primary_region
  providers = {
    aws = aws.us-west-1
  }
  account_type                      = var.account_type
  security_administrator_account_id = var.security_administrator_account_id
  tags                = var.tags
}
resource "aws_guardduty_organization_admin_account" "guardduty-us-west-1" {
  count             = var.enable_guardduty && var.account_type == "master" ? 1 : 0
  admin_account_id  = var.security_administrator_account_id
  provider          = aws.us-west-1
  depends_on        = [aws_organizations_organization.self]
}

module "guardduty-us-west-2" {
  source              = "./modules/guardduty"
  count               = var.enable_guardduty && var.account_type == "administrator" ? 1 : 0
  depends_on          = [aws_organizations_organization.self, module.guardduty-us-east-1]
  enable              = var.enable_guardduty && var.account_type == "administrator"
  org_account_active_map  = var.org_account_active_map
  org_primary_region  = var.org_primary_region
  providers = {
    aws = aws.us-west-2
  }
  account_type                      = var.account_type
  security_administrator_account_id = var.security_administrator_account_id
  tags                = var.tags
}
resource "aws_guardduty_organization_admin_account" "guardduty-us-west-2" {
  count             = var.enable_guardduty && var.account_type == "master" ? 1 : 0
  admin_account_id  = var.security_administrator_account_id
  provider          = aws.us-west-2
  depends_on        = [aws_organizations_organization.self]
}
