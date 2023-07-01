resource "aws_instance" "local_exec_webserver" {
  ami                    = data.aws_ami.amazon_linux2.image_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.local_exec_webserver_sg.id]
  user_data              = data.template_file.user_data.rendered
  tags = {
    Name        = "local_exec_webserver_${var.env}"
    Environment = var.env
  }

  provisioner "local-exec" {
    command = "echo ${self.public_ip} > local_exec_webserver_public_ip.txt"
  }
}

resource "aws_security_group" "local_exec_webserver_sg" {
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
  security_group_id = aws_security_group.local_exec_webserver_sg.id
}

resource "aws_security_group_rule" "http_ingress" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.local_exec_webserver_sg.id
}

resource "aws_security_group_rule" "egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.local_exec_webserver_sg.id
}