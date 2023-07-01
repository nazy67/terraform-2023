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

  # provisioner "local-exec" {
  #   when    = destroy
  #   command = "sleep 60"
  # }

  #   provisioner "local-exec" {
  #   command    = "echo ${self.public_ip} > webserver_public_ip.txt"
  #   on_failure = continue
  # }

#   provisioner "local-exec" {
#    command = "echo 'Creation is successful.' >> creation.txt"
#  }
 
#  provisioner "local-exec" {
#    when = destroy
#    command = "echo 'Destruction is successful.' >> destruction.txt"
#  }