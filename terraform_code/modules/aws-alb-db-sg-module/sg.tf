resource "aws_security_group" "security_group_for_all" {
  name        = "${var.sg_name}-security-group"
  description = "Allow access to Webservers and Databses"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = local.inbound_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = var.protocol
      cidr_blocks = var.cidr_blocks_web
    }
  }

  dynamic "egress" {
    for_each = local.outbound_ports
    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = var.protocol
      cidr_blocks = var.cidr_blocks_web

    }
  }

  tags = {
    Application = "Blog-website"
    Environment = "test"
  }
}