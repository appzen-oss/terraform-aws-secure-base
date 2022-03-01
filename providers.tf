
provider "aws" {
  region = var.aws_region
}
provider "aws" {
  alias   = "org-master"
  profile = "appzen-admin"
  region  = var.aws_region
}
