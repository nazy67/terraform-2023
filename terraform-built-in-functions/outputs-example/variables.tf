variable "aws_region" {
  type = string
  default = "us-east-1"
}

variable "env" { 
  type = string
}

variable "production_variable" { 
  default = "t2.large"
}

variable "development_variable" { 
  default = "t2.micro"
}