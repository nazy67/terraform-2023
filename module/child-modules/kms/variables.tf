variable "deletion_window_in_days" {
  description = "delete kms key in 7 days"
  type        = number
}

variable "description" {
  description = "descrition of kms key"
  type        = string
}

variable "enabled" {
  description = "enabled to is by default is true or change between booleans true/false"
  type        = bool
}

variable "enable_key_rotation" {
  description = "enable key rotation is true/false"
  type        = bool
}