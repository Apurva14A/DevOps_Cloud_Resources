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

