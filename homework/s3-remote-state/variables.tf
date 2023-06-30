variable "bucket_name" {
  default     = "akumo-terraform-state-2023-june"
  type        = string
  description = "bucket name"
}

variable "env" {
  description = "environment"
  type        = string
  default     = "dev"
}

variable "aws_region" {
  description = "aws region"
  type        = string
  default     = "us-east-1"
}