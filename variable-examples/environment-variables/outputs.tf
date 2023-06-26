output "web_1_public_ip" {
  value       = aws_instance.my-webserver-1.public_ip
  description = "public ip of my-webserver-1"
}

output "web_2_public_ip" {
  value       = aws_instance.my-webserver-2.public_ip
  description = "private ip of my-webserver-2 "
}