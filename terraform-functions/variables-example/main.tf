resource "aws_instance" "webserver" {
  ami                    = data.aws_ami.amazon_linux2.image_id
  instance_type          = var.instance_types.nonprod.instance_type
}