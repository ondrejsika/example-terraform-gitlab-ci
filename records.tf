resource "cloudflare_record" "vm0" {
  zone_id = local.sikademo_com_id
  name    = digitalocean_droplet.vm0.name
  value   = digitalocean_droplet.vm0.ipv4_address
  type    = "A"
}

output "vm0_fqdn" {
  value = cloudflare_record.vm0.hostname
}
