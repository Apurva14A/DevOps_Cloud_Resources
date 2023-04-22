# EC2 variable config

variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "key_name" {
  type = string
}

# variable "vpc_id" {
#   type        = string
#   description = "VPC id for ec2 instance"
# }

variable "az" {
  type        = string
  description = "Availability zone for subnet id"
}

variable "app_name" {
  type = string
}

variable "env_name" {
  type = string
}

#--------------------------------------------------------

# Terraform provider config

variable "region" {
  type = string
}

variable "profile_name" {
  type = string
}
