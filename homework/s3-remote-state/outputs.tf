output "s3-bucket-name" {
  value       = aws_s3_bucket.akumo-remote-state.id
  description = "private ip of webserver"
}

output "random-pet-name" {
  value       = random_pet.s3_name.id
  description = "private ip of webserver"
}