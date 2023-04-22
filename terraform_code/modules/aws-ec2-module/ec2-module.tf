resource "aws_instance" "ec2_module" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = data.aws_subnets.blog_subnet.id
  vpc_security_group_ids = [data.aws_security_groups.blog_sg.id]
  key_name               = var.key_name
  #iam_instance_profile   = " "

  tags = {
    Application = var.app_name
    Environment = var.env_name
  }
}


data "aws_subnets" "blog_subnet" {

  filter {
    name   = "availability-zone"
    values = [var.az]
  }
}

data "aws_subnet" "subnet" {
  for_each = toset(data.aws_subnets.blog_subnet.ids)
  id       = each.value
}


data "aws_security_groups" "blog_sg" {
  tags = {
    Application = "blog-website"
    Environment = "test"
  }
}