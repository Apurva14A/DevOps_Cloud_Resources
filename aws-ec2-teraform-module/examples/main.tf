provider "aws" {
  region       = local.region
  
}

locals {
  region = var.region
}

module "ec2_module" {
  source = "../modules"


}