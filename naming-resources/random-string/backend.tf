### Remote backend ###
terraform {
  backend "s3" {
    bucket = "akumo-terraform-state-2023"
    key    = "terraform/randome-string.tfstate"
    region = "us-east-1"
  } 
}