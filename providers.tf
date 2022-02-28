
provider "aws" {
  region = var.aws_region
}
provider "aws" {
  alias  = "org-master"
  region = var.aws_region
}
