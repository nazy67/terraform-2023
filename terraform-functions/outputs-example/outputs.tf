output "instance_type" {
  value = "${var.env == "production" ? var.production_variable : var.development_variable}"
}