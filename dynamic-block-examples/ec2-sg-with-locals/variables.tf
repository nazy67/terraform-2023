variable "env" {
  default     = "prod"
  description = "prod environment"
  type        = string
}

variable "instance_type" {
  default     = "t2.micro"
  description = "instance type for webserver."
  type        = string
}

variable "key_name" {
  description = "this is my key name"
  default     = "nazy-local-key"
  type        = string
}