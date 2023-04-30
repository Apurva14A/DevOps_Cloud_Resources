variable "region" {
  type        = string
  description = "AWS Region for provisioning s3 bucket"
  default     = "ap-south-1"

}

variable "profile_name" {
    type = string
    description = "AWS Iam user profle name"
    default = "user1"
  
}

variable "bucket_name" {
  type        = string
  description = "S3 bucket name for wesite hosting"
  default     = "DevOps-SRE"

}

variable "app_name" {
  type        = string
  description = "Application name"
  default     = "Blogging-website"

}

variable "env_name" {
  type        = string
  description = "Environment name"
  default     = "dev"

}