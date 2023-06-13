output "web_public_ip" {
  value = digitalocean_droplet.web.ipv4_address
}

output "web_private_ip" {
  value = digitalocean_droplet.web.ipv4_address_private
}