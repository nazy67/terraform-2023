terraform {
  backend "local" {
    path = "state-folder/terraform.tfstate"
  }
}