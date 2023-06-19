resource "aws_instance" "first_ec2" {
    ami           = "ami-0affd4508a5d2481b" #change to image id from your aws account
    instance_type = "t2.micro"
    tags = {
        Name        = "terraform-vm"
        owner       = "nazy.khalilova@gmail.com" # change email to your own
        Environment = "Dev"
        ManagedBy   = "terraform"
        Git_url    = "https://github.com/nazy67/terraform/tree/main/aws_data_ami_ec2_sg" # change github link to your own
    }
}