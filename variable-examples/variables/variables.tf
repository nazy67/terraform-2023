variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "aws region where resources will be provisioned"
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "instance type"
}

variable "env" {
  type        = string
  default     = "dev"
  description = "environment"
}

variable "key_name" {
  type        = string
  default     = "nazy-local-key"
  description = "key name"
}