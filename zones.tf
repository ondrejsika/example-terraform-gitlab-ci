data "cloudflare_zones" "sikademo_com" {
  filter {
    name = "sikademo.com"
  }
}

locals {
  sikademo_com_id = data.cloudflare_zones.sikademo_com.zones[0].id
}
