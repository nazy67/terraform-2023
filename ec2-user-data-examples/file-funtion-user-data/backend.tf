### Remote backend ###
terraform {
  backend "s3" {
    bucket = "akumo-terraform-state-2023-june"
    key    = "terraform/file-funtion-user-data.tfstate"
    region = "us-east-1"
  } 
}