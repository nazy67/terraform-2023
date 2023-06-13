### Digital Ocean ###
terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "2.28.1"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

### AWS ###
terraform {
 required_version = "~>1.4.6"
 required_providers {
  aws = {
   source = "hashicorp/aws"
   version = "~>4.0.0"
  }
 }
}

provider "aws" {
 region = "us-east-1"
 access_key=var.aws_access_key
 secret_key=var.aws_secret_key
}

### GCP ###
