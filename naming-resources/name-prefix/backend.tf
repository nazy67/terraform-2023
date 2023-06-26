### Remote backend ###
terraform {
  backend "s3" {
    bucket = "akumo-terraform-state-2023"
    key    = "terraform/name-prefix.tfstate"
    region = "us-east-1"
  } 
}