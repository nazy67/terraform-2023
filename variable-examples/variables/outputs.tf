output "web_public_ip" {
  value       = aws_instance.test_instance.public_ip
  description = "public ip of test_instance "
}

output "web_private_ip" {
  value       = aws_instance.test_instance.private_ip
  description = "private ip test_instance"
}