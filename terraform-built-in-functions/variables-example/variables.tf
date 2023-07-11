variable "instance_types" {
  type = map(any)
  default = {
    "nonprod" = {
      "instance_type" = "t2.micro",
    },
    "preprod" = {
      "instance_type" = "t2.medium",
    },
    "prod" = {
      "instance_type" = "t2.large",
    },
  }
}

variable "aws_region" {
  type = string
  default = "us-east-1"
}