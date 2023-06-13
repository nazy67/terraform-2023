resource "digitalocean_vpc" "my-vpc" {
 name   = "project-network"
 region = "nyc1"
 ip_range = "10.0.0.0/24"
}

resource "digitalocean_project" "terraform" {
 name        = "${var.env}-terraform"
 description = "A project to represent development resources."
 purpose     = "app"
 environment = "dev"
}

resource "digitalocean_project_resources" "tf-project" {
 project = digitalocean_project.terraform.id
 resources = [
   digitalocean_vpc.my-vpc.urn,
   digitalocean_droplet.web.urn
 ]
}

resource "digitalocean_droplet" "web" {
  image  = data.digitalocean_image.centos_image.id
  name   = "${var.env}-web"
  region = var.region_for_droplet
  size   = var.droplet_size
  ssh_keys = [data.digitalocean_ssh_key.ssh-key.id]
  vpc_uuid = digitalocean_vpc.my-vpc.id
  tags   = [digitalocean_tag.env.id, digitalocean_tag.project.id, digitalocean_tag.web.id, digitalocean_tag.team.id]
}

resource "digitalocean_tag" "env" {
  name = "dev"
}

resource "digitalocean_tag" "project" {
  name = "main"
}

resource "digitalocean_tag" "team" {
  name = "eng"
}

resource "digitalocean_tag" "web" {
  name = "app"
}

data "digitalocean_image" "ubuntu_image" {
 slug = "ubuntu-18-04-x64"
}

data "digitalocean_ssh_key" "ssh-key" {
  name = "mynewkey"
}