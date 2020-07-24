resource "cloudflare_record" "xgd-domain-identity-records" {
  zone_id = var.xgd_cf_id
  name    = "_amazonses.${var.domains["xgd"]}"
  type    = "TXT"
  ttl     = "600"
  value   = aws_ses_domain_identity.xgd.verification_token
}

resource "cloudflare_record" "xgd-dkim-records" {
  count   = 3
  zone_id = var.xgd_cf_id
  name    = "${element(aws_ses_domain_dkim.xgd.dkim_tokens, count.index)}._domainkey.${var.domains["xgd"]}"
  type    = "CNAME"
  ttl     = "600"
  value   = "${element(aws_ses_domain_dkim.xgd.dkim_tokens, count.index)}.dkim.amazonses.com"
}

resource "cloudflare_record" "xgd-mx-records-10" {
  zone_id  = var.xgd_cf_id
  name     = var.domains["xgd"]
  type     = "MX"
  ttl      = "600"
  value    = "inbound-smtp.us-east-1.amazonaws.com"
  priority = "10"
}

resource "cloudflare_record" "xgd-spf-records" {
  zone_id = var.xgd_cf_id
  name    = var.domains["xgd"]
  type    = "TXT"
  ttl     = "600"
  value   = "v=spf1 include:amazonses.com -all"
}