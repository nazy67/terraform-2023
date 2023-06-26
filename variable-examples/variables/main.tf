resource "aws_instance" "test_instance" {
  ami           = data.aws_ami.amazon_linux2.image_id
  instance_type = var.instance_type
  tags           = local.common_tags
}