output "web_public_ip" {
  value       = aws_instance.my-webserver.public_ip
  description = "public ip of webserver"
}

output "web_private_ip" {
  value       = aws_instance.my-webserver.private_ip
  description = "private ip of webserver"
}