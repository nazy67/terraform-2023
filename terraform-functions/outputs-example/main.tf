resource "aws_instance" "webserver" {
  ami                    = data.aws_ami.amazon_linux2.image_id
  instance_type          = "${var.env == "production" ? var.production_variable : var.development_variable}"
}