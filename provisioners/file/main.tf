resource "aws_instance" "file_webserver" {
  ami                    = data.aws_ami.amazon_linux2.image_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.file_webserver_sg.id]
  user_data              = data.template_file.user_data.rendered
  tags = {
    Name        = "file_webserver_${var.env}"
    Environment = var.env
  }

  provisioner "file" {
    content = "This file is created by file provisioner!"
    destination = "/tmp/file.txt"
  }

  provisioner "file" {
    content     = "ami used: ${self.ami}"
    destination = "/tmp/file.log"
  }

  connection {
    type = "ssh"
    host = self.public_ip
    user = "ec2-user"
    port = 22
    private_key = file("/Users/nazgulkhalilova/.ssh/id_rsa")  
  }
}

resource "aws_security_group" "file_webserver_sg" {
  name        = "webserver security group"
  description = "Allow TLS inbound traffic"
  tags = {
    Name = "webserver_sg_${var.env}"
  }
}

resource "aws_security_group_rule" "ssh_ingress" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.file_webserver_sg.id
}

resource "aws_security_group_rule" "http_ingress" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.file_webserver_sg.id
}

resource "aws_security_group_rule" "egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.file_webserver_sg.id
}