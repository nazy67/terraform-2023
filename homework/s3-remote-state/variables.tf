variable "bucket_name" {
    default =  "remote-state-terraform-dev-june-2023"
    type = string
    description = "bucket name"
}

variable "env" {
    description = "environment"
    type = string
    default = "dev"
}