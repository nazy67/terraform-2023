output "public_ip" {
  value       = module.amazon_linux.web_public_ip
  description = "public ip of webserver"
}

output "private_ip" {
  value       = module.amazon_linux.web_private_ip
  description = "private ip of webserver"
}