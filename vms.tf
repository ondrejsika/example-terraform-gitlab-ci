resource "digitalocean_droplet" "vm0" {
  image  = "docker-18-04"
  name   = "vm0"
  region = "fra1"
  size   = "s-1vcpu-2gb"
  ssh_keys = [
    digitalocean_ssh_key.default.id
  ]
}

output "vm0_ip" {
  value = digitalocean_droplet.vm0.ipv4_address
}
