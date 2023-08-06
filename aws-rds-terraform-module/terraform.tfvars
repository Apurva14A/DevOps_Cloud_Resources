identifier             = "django-rds"
allocated_storage      = 20
storage_type           = "gp2"
engine                 = "postgres"
engine_version         = "14.7"
instance_class         = "db.t3.micro"
db_name                = "django_db"
username               = "django_user"
password               = "django_password"
port                   = "5432"
vpc_security_group_ids = ["sg-0954ecefa42f618f0", "sg-08184ae89101e2a05"]
#db_subnet_group_name = "value"
network_type = "IPV4"
#availability_zone = "value"
#iops                  = ""
max_allocated_storage = 50

# DB Parameter group

name        = "django-db-parameter-group"
description = "Django app db parameter group"
family      = "postgres14"
# parameters = [{
#   "name"         = "parameter group django"
#   "value"        = "1"
#   "apply_method" = "pending-reboot"
# }]
