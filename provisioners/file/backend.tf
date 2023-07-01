### Remote backend ###
terraform {
  backend "s3" {
    bucket = "akumo-terraform-state-2023-june"
    key    = "terraform/file_webserver.tfstate"
    region = "us-east-1"
  } 
}