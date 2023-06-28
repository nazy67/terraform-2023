data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "owner-id"
    values = ["137112412989"]
  }

  filter {
    name   = "name"
    values = ["al2023-ami-2023*"]
  }
}