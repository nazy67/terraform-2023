resource "aws_instance" "remote_exec_webserver" {
  ami                    = data.aws_ami.amazon_linux2.image_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.remote_exec_webserver_sg.id]
  tags = {
    Name        = "remote_exec_webserver_${var.env}"
    Environment = var.env
  }

  provisioner "file" {
    source      = "./install_terraform.sh"
    destination = "/home/ec2-user/install_terraform.sh"
  }
 
  provisioner "remote-exec" {
    inline = [
      "chmod 777 ./install_terraform.sh",
      "./install_terraform.sh"
    ]
  }

  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    port        = 22
    private_key = file("/Users/nazgulkhalilova/.ssh/id_rsa")
  }
}

resource "aws_security_group" "remote_exec_webserver_sg" {
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
  security_group_id = aws_security_group.remote_exec_webserver_sg.id
}

resource "aws_security_group_rule" "http_ingress" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.remote_exec_webserver_sg.id
}

resource "aws_security_group_rule" "egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.remote_exec_webserver_sg.id
}