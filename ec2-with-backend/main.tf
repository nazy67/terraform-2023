resource "aws_instance" "my-webserver" {
  ami           = data.aws_ami.amazon_linux2.image_id
  instance_type = var.instance_type
  key_name      = var.key_name
  user_data            = data.template_file.user_data.rendered
  vpc_security_group_ids = [aws_security_group.web-sg.id]
  tags = merge(
    local.common_tags,
    {
      Name = "${var.env}_webserver-${random_pet.random_name.id}"
    }
  )
}

resource "random_pet" "random_name" {
  length    = 3
  separator = "-"
  prefix    = "wordpress"
}

resource "aws_security_group" "web-sg" {
  name_prefix = "local.appname-web-sg"
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