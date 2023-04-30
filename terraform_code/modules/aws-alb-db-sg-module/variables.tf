variable "sg_name" {
  type        = string
  description = "EC2 , ALB, RDS security group name"
  default     = "ec2-alb-rds-sg"

}
variable "vpc_id" {
  type        = string
  description = "Vpc id used in security group"
  default     = "vpc-0b4dc16bba90fcd81"
}

variable "protocol" {
  type        = string
  description = "Protocol for security group"
  default     = "TCP"

}

variable "cidr_blocks_web" {
  type        = list(string)
  description = "List of all cidr blocks for security group"
  default     = ["0.0.0.0/0"]
}

variable "app_name" {
  type        = string
  description = "Application name for all the resources"
  default     = "Blog-website"
}

variable "env_name" {
  type        = string
  description = "Environment name "
  default     = "test"
}


#--------------------------------------------------------------------------------------------------
# Provider configuration

variable "profile_name" {
  type        = string
  description = "AWS user profile name"
  default     = "user1"

}

variable "region" {
  type        = string
  description = "AWS region for all resources to be created"

  default = "ap-south-1"

}

#--------------------------------------------------------------------------------------------------------

# locals variable

locals {
  inbound_ports  = [80, 8080, 443]
  outbound_ports = [443, 5432, 3306]
}