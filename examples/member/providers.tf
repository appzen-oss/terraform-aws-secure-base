
provider "aws" {
  profile = var.aws_profile
  region  = var.aws_region
}
provider "aws" {
  alias   = "org-master"
  profile = "#AWS profile#"
  region  = var.aws_region
}
