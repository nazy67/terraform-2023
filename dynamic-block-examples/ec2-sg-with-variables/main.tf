resource "aws_instance" "my-webserver" {
  ami                    = data.aws_ami.amazon_linux2.image_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  user_data              = file("template_file/user_data.sh")
  vpc_security_group_ids = [aws_security_group.web-sg.id]
  tags = merge(
    local.common_tags,
    {
      Name = "webserver-${var.env}"
    }
  )
}

resource "aws_security_group" "web-sg" {
  name        = "webserver-sg-${var.env}"
  description = "this sg allowes port 22"

  dynamic "ingress" {
    for_each = var.ingress_rules

    content {
      description = ingress.value.description
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks      
    }
  }

  dynamic "egress" {
    for_each = var.egress_rules

    content {
      description = egress.value.description
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks      
    }
  }

  tags = {
    Name = "web-sg"
  }
}