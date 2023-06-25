locals {
  tags = {
    Name        = "webserver"
    owner       = "nkhalilova@akumosolutions.io"
    Environment = "dev"
    ManagedBy   = "terraform"
  }
}

# locals {
#   common_tags = {
#     Name        = "webserver"
#     owner       = "nkhalilova@akumosolutions.io"
#     Environment = "dev"
#     ManagedBy   = "terraform"
#   }
# }