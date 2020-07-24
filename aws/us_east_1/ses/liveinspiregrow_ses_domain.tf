resource "cloudflare_record" "liveinspiregrow-domain-identity-records" {
  zone_id = var.liveinspiregrow_cf_id
  name    = "_amazonses.${var.domains["liveinspiregrow"]}"
  type    = "TXT"
  ttl     = "600"
  value   = aws_ses_domain_identity.liveinspiregrow.verification_token
}

resource "cloudflare_record" "liveinspiregrow-dkim-records" {
  count   = 3
  zone_id = var.liveinspiregrow_cf_id
  name    = "${element(aws_ses_domain_dkim.liveinspiregrow.dkim_tokens, count.index)}._domainkey.${var.domains["liveinspiregrow"]}"
  type    = "CNAME"
  ttl     = "600"
  value   = "${element(aws_ses_domain_dkim.liveinspiregrow.dkim_tokens, count.index)}.dkim.amazonses.com"
}

resource "cloudflare_record" "liveinspiregrow-mx-records-10" {
  zone_id  = var.liveinspiregrow_cf_id
  name     = var.domains["liveinspiregrow"]
  type     = "MX"
  ttl      = "600"
  value    = "inbound-smtp.us-east-1.amazonaws.com"
  priority = "10"
}

resource "cloudflare_record" "liveinspiregrow-spf-records" {
  zone_id = var.liveinspiregrow_cf_id
  name    = var.domains["liveinspiregrow"]
  type    = "TXT"
  ttl     = "600"
  value   = "v=spf1 include:amazonses.com -all"
}