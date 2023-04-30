terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>4.64.0"
    }
  }
}

provider "aws" {
  region = var.region
  profile                  = var.profile_name
  shared_credentials_files = ["~/.aws/credentials"]

}


resource "aws_s3_bucket" "blog_website" {
  bucket = "${var.bucket_name}-blog-website"

  tags = {
    Application = var.app_name
    Environment = var.env_name
  }
}

