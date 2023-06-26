resource "aws_instance" "my-webserver" {
  ami           = data.aws_ami.amazon_linux2.image_id
  instance_type = var.instance_type
  key_name      = var.key_name
  tags = merge(
    local.common_tags,
    {
      Name = "${var.env}_webserver"
    }
  )
}