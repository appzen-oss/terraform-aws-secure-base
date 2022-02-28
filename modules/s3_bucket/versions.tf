terraform {
  required_version = ">= 1.1.4"

  required_providers {
    aws = {
      source                = "hashicorp/aws"
      version               = ">= 4.1.0"
      configuration_aliases = [aws.org-master]
    }
    time = {
      source  = "hashicorp/time"
      version = ">= 0.7.2"
    }
  }
}
