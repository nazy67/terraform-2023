resource "aws_instance" "example" {
    ami           = "ami-0715c1897453cabd1"
    instance_type = "t2.micro"
    tags = {
        Name = "terraform-vm"
    }
}