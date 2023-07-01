variable "env" {
  description = "name of the env"
  default     = "stage"
  type        = string
}

variable "instance_type" {
  description = "instance type"
  default     = "t2.micro"
  type        = string
}

variable "aws_region" {
  description = "aws region"
  type        = string
  default     = "us-east-1"
}

variable "key_name" {
  description = "this is my key name"
  default     = "nazy-local-key"
  type        = string
}