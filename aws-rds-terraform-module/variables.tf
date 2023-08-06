# RDS instance variable configurations
variable "create" {
  description = "Whether to create this resource or not?"
  type        = bool
  default     = true
}

variable "identifier" {
  description = "The name of the RDS instance"
  type        = string
}

variable "use_identifier_prefix" {
  description = "Determines whether to use `identifier` as is or create a unique identifier beginning with `identifier` as the specified prefix"
  type        = bool
  default     = false
}

variable "replicate_source_db" {
  description = "Specifies that this resource is a Replicate database, and to use this value as the source database. This correlates to the identifier of another Amazon RDS Database to replicate."
  type        = string
  default     = null
}

variable "allocated_storage" {
  description = "The allocated storage in gigabytes"
  type        = string
  default     = 20
}

variable "storage_type" {
  description = "One of 'standard' (magnetic), 'gp2' (general purpose SSD), 'gp3' (new generation of general purpose SSD), or 'io1' (provisioned IOPS SSD). The default is 'io1' if iops is specified, 'gp2' if not. If you specify 'io1' or 'gp3' , you must also include a value for the 'iops' parameter"
  type        = string
  default     = null
}

variable "engine" {
  description = "The database engine to use"
  type        = string
  default     = null
}

variable "engine_version" {
  description = "The engine version to use"
  type        = string
  default     = null
}

variable "instance_class" {
  description = "The instance type of the RDS instance"
  type        = string
  default     = null
}

variable "db_name" {
  description = "The DB name to create. If omitted, no database is created initially"
  type        = string
  default     = null
}

variable "manage_master_user_password" {
  description = "Set to true to allow RDS to manage the master user password in Secrets Manager. Cannot be set if password is provided"
  type        = bool
  default     = false
}

variable "username" {
  description = "Username for the master DB user"
  type        = string
  default     = null
}

variable "password" {
  description = "Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file"
  type        = string
  default     = null
}


variable "port" {
  description = "The port on which the DB accepts connections"
  type        = string
  default     = null
}


variable "vpc_security_group_ids" {
  description = "List of VPC security groups to associate"
  type        = list(string)
  default     = []
}

variable "db_subnet_group_name" {
  description = "Name of DB subnet group. DB instance will be created in the VPC associated with the DB subnet group. If unspecified, will be created in the default VPC"
  type        = string
  default     = null
}

variable "parameter_group_name" {
  description = "Name of the DB parameter group to associate"
  type        = string
  default     = null
}

variable "availability_zone" {
  description = "The Availability Zone of the RDS instance"
  type        = string
  default     = null
}

variable "skip_final_snapshot" {
  description = "Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created. If false is specified, a DB snapshot is created before the DB instance is deleted"
  type        = bool
  default     = true
}

# variable "iops" {
#   description = "The amount of provisioned IOPS. Setting this implies a storage_type of 'io1' or `gp3`. See `notes` for limitations regarding this variable for `gp3`"
#   type        = number
#   default     = null
# }

variable "publicly_accessible" {
  description = "Bool to control if instance is publicly accessible"
  type        = bool
  default     = true
}

variable "allow_major_version_upgrade" {
  description = "Indicates that major version upgrades are allowed. Changing this parameter does not result in an outage and the change is asynchronously applied as soon as possible"
  type        = bool
  default     = false
}

variable "auto_minor_version_upgrade" {
  description = "Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window"
  type        = bool
  default     = true
}

variable "max_allocated_storage" {
  description = "Specifies the value for Storage Autoscaling"
  type        = number
  default     = 0
}

variable "apply_immediately" {
  description = "Specifies whether any database modifications are applied immediately, or during the next maintenance window"
  type        = bool
  default     = false
}

variable "maintenance_window" {
  description = "The window to perform maintenance in. Syntax: 'ddd:hh24:mi-ddd:hh24:mi'. Eg: 'Mon:00:00-Mon:03:00'"
  type        = string
  default     = null
}

variable "network_type" {
  description = "The type of network stack"
  type        = string
  default     = null
}

#---------------------------------------------------------------------------------------------------------------------------------------------
# DB Parameter group config

variable "name" {
  description = "The name of the DB parameter group"
  type        = string
  default     = ""
}

variable "use_name_prefix" {
  description = "Determines whether to use `name` as is or create a unique name beginning with `name` as the specified prefix"
  type        = bool
  default     = true
}

variable "description" {
  description = "The description of the DB parameter group"
  type        = string
  default     = null
}

variable "family" {
  description = "The family of the DB parameter group"
  type        = string
  default     = null
}

# variable "parameters" {
#   description = "A list of DB parameter maps to apply"
#   type        = list(map(string))
#   default     = []
# }


# Locals variables
locals {

  identifier        = var.use_identifier_prefix ? null : var.identifier
  identifier_prefix = var.use_identifier_prefix ? "${var.identifier}-" : null
  is_replica        = var.replicate_source_db != null
  name              = var.use_name_prefix ? null : var.name
  name_prefix       = var.use_name_prefix ? "${var.name}-" : null

  description = coalesce(var.description, format("%s parameter group", var.name))
}
