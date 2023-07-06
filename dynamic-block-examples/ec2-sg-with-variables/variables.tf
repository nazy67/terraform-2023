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

variable "ingress_rules" {
  type =  list(any)
  default = [{
    description = "this sg rule allows port 22"
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
  },
  {
    description = "this sg rule allows port 80",
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
  },
  {
    description = "this sg rule allows port 443",
    from_port = 443
    to_port   = 443
    protocol  = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
  }
 ]
}

variable "egress_rules" {
  type =  list(any)
  default = [{
    description = "this sg rule allows port outbound 443",
    from_port = 443
    to_port   = 443
    protocol  = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  },
  {
    description = "this sg rule allows port outbound to all"
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
 ]
}