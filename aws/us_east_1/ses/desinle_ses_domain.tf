resource "cloudflare_record" "desinle-domain-identity-records" {
  zone_id = var.desinle_cf_id
  name    = "_amazonses.${var.domains["desinle"]}"
  type    = "TXT"
  ttl     = "600"
  value   = aws_ses_domain_identity.desinle.verification_token
}

resource "cloudflare_record" "desinle-dkim-records" {
  count   = 3
  zone_id = var.desinle_cf_id
  name    = "${element(aws_ses_domain_dkim.desinle.dkim_tokens, count.index)}._domainkey.${var.domains["desinle"]}"
  type    = "CNAME"
  ttl     = "600"
  value   = "${element(aws_ses_domain_dkim.desinle.dkim_tokens, count.index)}.dkim.amazonses.com"
}

resource "cloudflare_record" "desinle-mx-records-10" {
  zone_id  = var.desinle_cf_id
  name     = var.domains["desinle"]
  type     = "MX"
  ttl      = "600"
  value    = "inbound-smtp.us-east-1.amazonaws.com"
  priority = "10"
}

resource "cloudflare_record" "desinle-spf-records" {
  zone_id = var.desinle_cf_id
  name    = var.domains["desinle"]
  type    = "TXT"
  ttl     = "600"
  value   = "v=spf1 include:amazonses.com -all"
}