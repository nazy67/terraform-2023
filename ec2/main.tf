resource "aws_instance" "my-webserver" {
    ami       = "ami-07dfed28fcf95241c"
    instance_type = "t2.micro"
    key_name = "new-name"
    vpc_security_group_ids = [aws_security_group.ssh-port.id]
    tags = {
      Name  = "webserver"
    }
}

resource "aws_security_group" "ssh-port" {
    name = "webserver-security-group-ssh"
    description = "this sg allowes port 22"
    vpc_id = "vpc-e505479d"

   ingress = {
    description = "allows port 22"
    from_port = 22
    to_port   = 22
    protocol = "tcp"
    cidr_blocks = ["98.227.136.153/32"]
   }

   egress = {
    from_port = 0
    to_port    = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
   }

  tags = {
    Name = "allow_22_443"
  }
}