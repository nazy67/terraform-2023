data "template_file" "user_data" {
  template = file("template_file/user_data.sh")
  vars = {
    env = var.env
  }
}

data "aws_ami" "amazon_linux2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}

  # provisioner "file" {
  #   source      = "conf/myapp.conf"
  #   destination = "/etc/myapp.conf"
  # }

  # provisioner "file" {
  #   source      = "/Desktop/someones_ssh_key.pub"
  #   destination = "/.ssh/authorized_keys"
  # }

  # provisioner "file" {
  #   content     = "ami used: ${self.ami}"
  #   destination = "/tmp/file.log"
  # }