variable "bucket_name" {
  default     = "akumore-remote-state-terraform-dev-june-2023"
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