
# Regional

module "iam_access_analyzer-us-east-1" {
  source     = "./modules/iam_access_analyzer"
  depends_on = [aws_organizations_organization.self]
  enable     = var.enable_iam_access_analyzer && contains(var.target_regions, "us-east-1")
  providers = {
    aws = aws.us-east-1
  }
  account_type = var.account_type
}

module "iam_access_analyzer-us-east-2" {
  source     = "./modules/iam_access_analyzer"
  depends_on = [aws_organizations_organization.self]
  enable     = var.enable_iam_access_analyzer && contains(var.target_regions, "us-east-2")
  providers = {
    aws = aws.us-east-2
  }
  account_type = var.account_type
}

module "iam_access_analyzer-eu-west-1" {
  source     = "./modules/iam_access_analyzer"
  depends_on = [aws_organizations_organization.self]
  enable     = var.enable_iam_access_analyzer && contains(var.target_regions, "eu-west-1")
  providers = {
    aws = aws.eu-west-1
  }
  account_type = var.account_type
}
