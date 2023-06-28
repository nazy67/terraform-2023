resource "aws_instance" "my-webserver" {
  ami                    = data.aws_ami.amazon_linux.image_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  tags = merge(
    local.common_tags,
    {
      Name = "webserver-${var.env}"
    }
  )
}