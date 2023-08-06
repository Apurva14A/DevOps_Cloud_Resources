output "db_parameter_group_id" {
  description = "The db parameter group id"
  value       = try(aws_db_parameter_group.django_db_pg[0].id, null)
}

output "db_parameter_group_arn" {
  description = "The ARN of the db parameter group"
  value       = try(aws_db_parameter_group.django_db_pg[0].arn, null)
}

output "db_instance_endpoint" {
  description = "The connection endpoint"
  value       = try(aws_db_instance.django_db[0].endpoint, null)
}

output "db_instance_status" {
  description = "The RDS instance status"
  value       = try(aws_db_instance.django_db[0].status, null)
}

output "db_instance_port" {
  description = "The database port"
  value       = try(aws_db_instance.django_db[0].port, null)
}
