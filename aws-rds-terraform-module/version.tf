terraform {
   backend "s3" {
      bucket  = "terraform-state-backend-2023"
      key = "django/s3/terraform.tfstate"
      region = "ap-south-1"
      
     
   }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.64.0"
    }
  }
}


