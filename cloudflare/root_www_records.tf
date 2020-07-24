resource "cloudflare_record" "desinle_root" {
  zone_id = cloudflare_zone.desinle.id
  name    = "@"
  value   = var.desinle_end
  type    = "CNAME"
  proxied = true
}

resource "cloudflare_record" "www_desinle_root" {
  zone_id = cloudflare_zone.desinle.id
  name    = "www"
  value   = var.www_desinle_end
  type    = "CNAME"
  proxied = true
}

resource "cloudflare_record" "biohole_root" {
  zone_id = cloudflare_zone.biohole.id
  name    = "@"
  value   = var.biohole_end
  type    = "CNAME"
  proxied = true
}

resource "cloudflare_record" "www_biohole_root" {
  zone_id = cloudflare_zone.biohole.id
  name    = "www"
  value   = var.www_biohole_end
  type    = "CNAME"
  proxied = true
}

resource "cloudflare_record" "xgd_root" {
  zone_id = cloudflare_zone.xgd.id
  name    = "@"
  value   = var.xgd_end
  type    = "CNAME"
  proxied = true
}

resource "cloudflare_record" "www_xgd_root" {
  zone_id = cloudflare_zone.xgd.id
  name    = "www"
  value   = var.www_xgd_end
  type    = "CNAME"
  proxied = true
}

resource "cloudflare_record" "machbio_root" {
  zone_id = cloudflare_zone.machbio.id
  name    = "@"
  value   = var.machbio_end
  type    = "CNAME"
  proxied = true
}

resource "cloudflare_record" "www_machbio_root" {
  zone_id = cloudflare_zone.machbio.id
  name    = "www"
  value   = var.www_machbio_end
  type    = "CNAME"
  proxied = true
}

resource "cloudflare_record" "liveinspiregrow_root" {
  zone_id = cloudflare_zone.liveinspiregrow.id
  name    = "@"
  value   = var.liveinspiregrow_end
  type    = "CNAME"
  proxied = true
}

resource "cloudflare_record" "www_liveinspiregrow_root" {
  zone_id = cloudflare_zone.liveinspiregrow.id
  name    = "www"
  value   = var.www_liveinspiregrow_end
  type    = "CNAME"
  proxied = true
}

resource "cloudflare_record" "weavebio_root" {
  zone_id = cloudflare_zone.weavebio.id
  name    = "@"
  value   = var.weavebio_end
  type    = "CNAME"
  proxied = true
}

resource "cloudflare_record" "www_weavebio_root" {
  zone_id = cloudflare_zone.weavebio.id
  name    = "www"
  value   = var.www_weavebio_end
  type    = "CNAME"
  proxied = true
}

