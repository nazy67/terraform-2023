resource "aws_instance" "my-webserver" {
  ami                    = data.aws_ami.amazon_linux2.image_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  user_data              = <<-EOF
  #!/bin/bash
  sudo yum update -y
  sudo yum install -y yum-utils shadow-utils
  sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
  sudo yum -y install terraform
  EOF
  vpc_security_group_ids = [aws_security_group.web-sg.id]
  tags                   = local.tags
}

resource "aws_security_group" "web-sg" {
  name        = "webserver-sg"
  description = "this sg allowes port 22"

  ingress {
    description = "allows port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["98.227.136.153/32"]
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