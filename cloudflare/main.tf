resource "cloudflare_zone" "desinle" {
  zone = "desinle.com"
}

# resource "cloudflare_zone_settings_override" "desinle" {
#   zone_id = cloudflare_zone.desinle.id
#   settings {
#     brotli                   = "on"
#     challenge_ttl            = 2700
#     security_level           = "high"
#     opportunistic_encryption = "on"
#     automatic_https_rewrites = "on"
#     ssl                      = "strict"
#     browser_cache_ttl        = 14400
#     always_use_https         = "on"
#     http3                    = "on"
#     zero_rtt                 = "on"

#     minify {
#       css  = "on"
#       js   = "off"
#       html = "on"
#     }
#     security_header {
#       enabled = true
#     }
#   }
# }

resource "cloudflare_page_rule" "desinle_1" {
  zone_id  = cloudflare_zone.desinle.id
  target   = "https://${var.www_domains["desinle"]}/*"
  priority = 1

  actions {
    forwarding_url {
      url         = "https://${var.domains["desinle"]}/*"
      status_code = "301"
    }
  }
}

resource "cloudflare_zone" "biohole" {
  zone = "biohole.com"
}

# resource "cloudflare_zone_settings_override" "biohole" {
#   zone_id = cloudflare_zone.biohole.id
#   settings {
#     brotli                   = "on"
#     challenge_ttl            = 2700
#     security_level           = "high"
#     opportunistic_encryption = "on"
#     automatic_https_rewrites = "on"
#     ssl                      = "strict"
#     browser_cache_ttl        = 14400
#     always_use_https         = "on"
#     http3                    = "on"
#     zero_rtt                 = "on"

#     minify {
#       css  = "on"
#       js   = "off"
#       html = "on"
#     }
#     security_header {
#       enabled = true
#     }
#   }
# }

resource "cloudflare_page_rule" "biohole_1" {
  zone_id  = cloudflare_zone.biohole.id
  target   = "https://${var.www_domains["biohole"]}/*"
  priority = 1

  actions {
    forwarding_url {
      url         = "https://${var.domains["biohole"]}/*"
      status_code = "301"
    }
  }
}

resource "cloudflare_zone" "machbio" {
  zone = "machb.io"
}

# resource "cloudflare_zone_settings_override" "machbio" {
#   zone_id = cloudflare_zone.machbio.id
#   settings {
#     brotli                   = "on"
#     challenge_ttl            = 2700
#     security_level           = "high"
#     opportunistic_encryption = "on"
#     automatic_https_rewrites = "on"
#     ssl                      = "strict"
#     browser_cache_ttl        = 14400
#     always_use_https         = "on"
#     http3                    = "on"
#     zero_rtt                 = "on"

#     minify {
#       css  = "on"
#       js   = "off"
#       html = "on"
#     }
#     security_header {
#       enabled = true
#     }
#   }
# }

resource "cloudflare_page_rule" "machbio_1" {
  zone_id  = cloudflare_zone.machbio.id
  target   = "https://${var.www_domains["machbio"]}/*"
  priority = 1

  actions {
    forwarding_url {
      url         = "https://${var.domains["machbio"]}/*"
      status_code = "301"
    }
  }
}

resource "cloudflare_zone" "xgd" {
  zone = "xgd.in"
}

# resource "cloudflare_zone_settings_override" "xgd" {
#   zone_id = cloudflare_zone.xgd.id
#   settings {
#     brotli                   = "on"
#     challenge_ttl            = 2700
#     security_level           = "high"
#     opportunistic_encryption = "on"
#     automatic_https_rewrites = "on"
#     ssl                      = "strict"
#     browser_cache_ttl        = 14400
#     always_use_https         = "on"
#     http3                    = "on"
#     zero_rtt                 = "on"

#     minify {
#       css  = "on"
#       js   = "off"
#       html = "on"
#     }
#     security_header {
#       enabled = true
#     }
#   }
# }

resource "cloudflare_page_rule" "xgd_1" {
  zone_id  = cloudflare_zone.xgd.id
  target   = "https://${var.www_domains["xgd"]}/*"
  priority = 1

  actions {
    forwarding_url {
      url         = "https://${var.domains["xgd"]}/*"
      status_code = "301"
    }
  }
}

resource "cloudflare_zone" "liveinspiregrow" {
  zone = "liveinspiregrow.com"
}

# resource "cloudflare_zone_settings_override" "liveinspiregrow" {
#   zone_id = cloudflare_zone.liveinspiregrow.id
#   settings {
#     brotli                   = "on"
#     challenge_ttl            = 2700
#     security_level           = "high"
#     opportunistic_encryption = "on"
#     automatic_https_rewrites = "on"
#     ssl                      = "strict"
#     browser_cache_ttl        = 14400
#     always_use_https         = "on"
#     http3                    = "on"
#     zero_rtt                 = "on"

#     minify {
#       css  = "on"
#       js   = "off"
#       html = "on"
#     }
#     security_header {
#       enabled = true
#     }
#   }
# }

resource "cloudflare_page_rule" "liveinspiregrow_1" {
  zone_id  = cloudflare_zone.liveinspiregrow.id
  target   = "https://${var.www_domains["liveinspiregrow"]}/*"
  priority = 1

  actions {
    forwarding_url {
      url         = "https://${var.domains["liveinspiregrow"]}/*"
      status_code = "301"
    }
  }
}

resource "cloudflare_zone" "weavebio" {
  zone = "weavebio.com"
}

# resource "cloudflare_zone_settings_override" "weavebio" {
#   zone_id = cloudflare_zone.weavebio.id
#   settings {
#     brotli                   = "on"
#     challenge_ttl            = 2700
#     security_level           = "high"
#     opportunistic_encryption = "on"
#     automatic_https_rewrites = "on"
#     ssl                      = "strict"
#     browser_cache_ttl        = 14400
#     always_use_https         = "on"
#     http3                    = "on"
#     zero_rtt                 = "on"

#     minify {
#       css  = "on"
#       js   = "off"
#       html = "on"
#     }
#     security_header {
#       enabled = true
#     }
#   }
# }

resource "cloudflare_page_rule" "weavebio_1" {
  zone_id  = cloudflare_zone.weavebio.id
  target   = "https://${var.www_domains["weavebio"]}/*"
  priority = 1

  actions {
    forwarding_url {
      url         = "https://${var.domains["weavebio"]}/*"
      status_code = "301"
    }
  }
}
