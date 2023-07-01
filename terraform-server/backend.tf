terraform {
  backend "s3" {
    bucket = "akumo-terraform-state-2023-june"
    key    = "terraform/tf-server.tfstate"
    region = "us-east-1"
  }
}