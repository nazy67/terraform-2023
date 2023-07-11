data "terraform_remote_state" "vpc" {
 backend = "s3"
 config = {
  bucket = "akumo-terraform-state-2023"
  key  = "terraform/vpc.tfstate"
  region = "us-east-1"
 }
}