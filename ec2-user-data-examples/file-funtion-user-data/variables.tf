variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "instance type"
}

# variable "image_id" {
#   type        = string
#   default     = "ami-0affd4508a5d2481b"
#   description = "imange id"
# }

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