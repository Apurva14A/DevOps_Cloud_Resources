# RDS instance config

resource "aws_db_instance" "django_db" {
  count = var.create ? 1 : 0

  identifier        = local.identifier
  identifier_prefix = local.identifier_prefix

  engine            = var.engine
  engine_version    = var.engine_version
  instance_class    = var.instance_class
  allocated_storage = local.is_replica ? null : var.allocated_storage
  storage_type      = var.storage_type


  db_name  = var.db_name
  username = !local.is_replica ? var.username : null
  password = !local.is_replica && var.manage_master_user_password ? null : var.password
  port     = var.port

  vpc_security_group_ids = var.vpc_security_group_ids
  db_subnet_group_name   = var.db_subnet_group_name
  parameter_group_name   = aws_db_parameter_group.django_db_pg[0].name
  network_type           = var.network_type

  availability_zone = var.availability_zone
  #iops                = var.iops
  publicly_accessible = var.publicly_accessible


  allow_major_version_upgrade = var.allow_major_version_upgrade
  auto_minor_version_upgrade  = var.auto_minor_version_upgrade
  apply_immediately           = var.apply_immediately
  maintenance_window          = var.maintenance_window
  skip_final_snapshot         = var.skip_final_snapshot



  tags = module.common_tags
  # Note: do not add `latest_restorable_time` to `ignore_changes`
  # https://github.com/terraform-aws-modules/terraform-aws-rds/issues/478
}


# AWS RDS DB Parameter group


resource "aws_db_parameter_group" "django_db_pg" {
  count = var.create ? 1 : 0

  name        = local.name
  name_prefix = local.name_prefix
  description = local.description
  family      = var.family

  # dynamic "parameter" {
  #   for_each = var.parameters
  #   content {
  #     name         = parameter.value.name
  #     value        = parameter.value.value
  #     apply_method = lookup(parameter.value, "apply_method", null)
  #   }
  # }

  tags = module.common_tags

  lifecycle {
    create_before_destroy = false
  }

}

module "common_tags" {
  source = "../aws-common-tags"

}