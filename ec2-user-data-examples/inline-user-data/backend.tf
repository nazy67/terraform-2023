### Local backend ###
# terraform {
#   backend "local" {
#     path = "state-folder/terraform.tfstate"
#   }
# }

### Remote backend ###
terraform {
  backend "s3" {
    bucket = "akumo-terraform-state-2023"
    key    = "terraform/inline-user-data.tfstate"
    region = "us-east-1"
  } 
}

### Terraform Cloud backend ###
# terraform {
#   backend "remote" {
#     hostname = "app.terraform.io"
#     organization = "nazy-main-org"
#     workspaces {
#       name = "non-production"
#     }
#   }
# }