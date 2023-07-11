### Equality operator
variable "user_count" {
  type        = number
  description = "Amount of users"

  validation {
    condition     = var.user_count != 1
    error_message = "User count cannot be 1"
  }
}

### Comparison operator
# variable "user_count" {
#   type        = number
#   description = "Amount of users"

#   validation {
#     condition     = var.user_count >= 1
#     error_message = "User count must be at least 1"
#   }
# }

### Logical operator
# variable "user_count" {
#   type        = number
#   description = "Amount of users"

#   validation {
#     condition     = var.user_count >= 1 && var.user_count <= 100
#     error_message = "User count must be between 1 and 100"
#   }
# }