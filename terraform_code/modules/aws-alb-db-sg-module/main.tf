terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.63.0"
    }
  }
}
provider "aws" {
  region                   = var.region
  profile                  = var.profile_name
  shared_credentials_files = ["~/.aws/credentials"]
}