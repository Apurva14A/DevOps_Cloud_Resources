resource "aws_db_parameter_group" "education" {
  name   = "education"
  family = "postgres14"

  parameter {
    name  = "log_connections"
    value = "1"
  }
}


resource "aws_db_instance" "education" {
  identifier             = var.indentifier_nm
  instance_class         = var.instance_type_db
  allocated_storage      = var.alloc_storage
  engine                 = var.engine
  engine_version         = var.engine_version
  username               = vcar.username
  password               = var.db_password
  db_subnet_group_name   = aws_db_subnet_group.education.name
  vpc_security_group_ids = [aws_security_group.rds.id]
  parameter_group_name   = aws_db_parameter_group.education.name
  publicly_accessible    = true
  skip_final_snapshot    = true
}
