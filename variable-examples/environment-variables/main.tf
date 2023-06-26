resource "aws_instance" "my-webserver-1" {
  ami           = data.aws_ami.amazon_linux2.image_id
  instance_type = var.instance_type
  key_name      = var.key_name
  tags = merge(
    local.common_tags,
    {
      Name = "${var.env}_webserver-1"
    }
  )
}

resource "aws_instance" "my-webserver-2" {
  ami           = data.aws_ami.amazon_ubuntu.image_id
  instance_type = var.instance_type
  key_name      = var.key_name
  tags = merge(
    local.common_tags,
    {
      Name = "${var.env}_webserver-2"
    }
  )
}