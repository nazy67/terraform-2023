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

  ingress {
    description = "allows port"
    from_port   = var.ssh_from_port
    to_port     = var.ssh_to_port
    protocol    = var.protocol
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "web-sg"
  }
}