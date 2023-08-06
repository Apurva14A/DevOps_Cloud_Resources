resource "aws_instance" "ec2_module" {
  for_each               = toset(data.aws_subnets.private.ids)
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = each.value
  vpc_security_group_ids = var.security_group
  key_name               = var.key_name
  #iam_instance_profile   = " "

  tags = module.common_tags
}

data "aws_subnets" "private" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }

  tags = {
    tier = "private"
  }
}
# data "aws_security_groups" "blog_sg" {
#   filter {
#     name   = "vpc-id"
#     values = [var.vpc_id]
#   }

#   tags = {
#     Application = "blog-website"
#     Environment = "test"
#   }

# }