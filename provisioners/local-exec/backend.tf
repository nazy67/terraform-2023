### Remote backend ###
terraform {
  backend "s3" {
    bucket = "akumo-terraform-state-2023-june"
    key    = "terraform/local_exec_webserver.tfstate"
    region = "us-east-1"
  } 
}