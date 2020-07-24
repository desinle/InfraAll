resource "cloudflare_record" "biohole-domain-identity-records" {
  zone_id = var.biohole_cf_id
  name    = "_amazonses.${var.domains["biohole"]}"
  type    = "TXT"
  ttl     = "600"
  value   = aws_ses_domain_identity.biohole.verification_token
}

resource "cloudflare_record" "biohole-dkim-records" {
  count   = 3
  zone_id = var.biohole_cf_id
  name    = "${element(aws_ses_domain_dkim.biohole.dkim_tokens, count.index)}._domainkey.${var.domains["biohole"]}"
  type    = "CNAME"
  ttl     = "600"
  value   = "${element(aws_ses_domain_dkim.biohole.dkim_tokens, count.index)}.dkim.amazonses.com"
}

resource "cloudflare_record" "biohole-mx-records-10" {
  zone_id  = var.biohole_cf_id
  name     = var.domains["biohole"]
  type     = "MX"
  ttl      = "600"
  value    = "inbound-smtp.us-east-1.amazonaws.com"
  priority = "10"
}

resource "cloudflare_record" "biohole-spf-records" {
  zone_id = var.biohole_cf_id
  name    = var.domains["biohole"]
  type    = "TXT"
  ttl     = "600"
  value   = "v=spf1 include:amazonses.com -all"
}