terraform {
  backend "s3" {
    bucket = "akumo-terraform-state-2023"
    key    = "terraform/terraform.tfstate"
    region = "us-east-1"
  } 
}