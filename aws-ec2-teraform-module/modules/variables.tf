# EC2 variable config
variable "create" {
  description = "Whether to create an instance"
  type        = bool
  default     = true
}

variable "ami_id" {
  description = "AMI ID use for instance"
  type = string
  default = ""
}

variable "availability_zone" {
  description = "AZ to start the instance in"
  type        = string
  default     = null
}

variable "associate_public_ip_address" {
  description = "Whether to associate a public IP address with an instance in a VPC"
  type        = bool
  default     = null
}

variable "instance_type" {
  description = "instance type for instance"
  type = string
  default = ""
}

variable "iam_instance_profile" {
  description = "IAM Instance Profile to launch the instance with. Specified as the name of the Instance Profile"
  type        = string
  default     = null
}
variable "instance_tags" {
  description = "Additional tags for the instance"
  type        = map(string)
  default     = {}
}

variable "ipv6_address_count" {
  description = "A number of IPv6 addresses to associate with the primary network interface. Amazon EC2 chooses the IPv6 addresses from the range of your subnet"
  type        = number
  default     = null
}

variable "ipv6_addresses" {
  description = "Specify one or more IPv6 addresses from the range of the subnet to associate with the primary network interface"
  type        = list(string)
  default     = null
}

variable "metadata_options" {
  description = "Customize the metadata options of the instance"
  type        = map(string)
  default = {
    "http_endpoint"               = "enabled"
    "http_put_response_hop_limit" = 1
    "http_tokens"                 = "optional"
  }
}

variable "private_ip" {
  description = "Private IP address to associate with the instance in a VPC"
  type        = string
  default     = null
}

variable "root_block_device" {
  description = "Customize details about the root block device of the instance. See Block Devices below for details"
  type        = list(any)
  default     = []
}

variable "key_name" {
  description = "Key name to be use for login to the server"
  type = string
  default = ""
}
variable "ebs_block_device" {
  description = "Additional EBS block devices to attach to the instance"
  type        = list(any)
  default     = []
}
variable "ebs_optimized" {
  description = "If true, the launched EC2 instance will be EBS-optimized"
  type        = bool
  default     = null
}



variable "vpc_id" {
  description = "vpc id to be used for creating instance"
  type        = string
  default = ""
}

variable "security_group" {
   description = "Security group for ec2 instance creation"
  type        = list(string)
 default = [ "" ]
}
#--------------------------------------------------------

# Terraform provider config

variable "region" {
  type = string
}
