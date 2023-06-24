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

variable "ssh_from_port" {
  description = "this is from port to ssh sg"
  default     = 22
  type        = number
}

variable "ssh_to_port" {
  description = "this is to port for ssh sg"
  default     = 22
  type        = number
}

variable "protocol" {
  description = "this is tcp port"
  default     = "tcp"
  type        = string
}