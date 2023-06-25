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
  default     = "local-key"
  description = "key name"
}