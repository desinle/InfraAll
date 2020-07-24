resource "cloudflare_record" "weavebio-domain-identity-records" {
  zone_id = var.weavebio_cf_id
  name    = "_amazonses.${var.domains["weavebio"]}"
  type    = "TXT"
  ttl     = "600"
  value   = aws_ses_domain_identity.weavebio.verification_token
}

resource "cloudflare_record" "weavebio-dkim-records" {
  count   = 3
  zone_id = var.weavebio_cf_id
  name    = "${element(aws_ses_domain_dkim.weavebio.dkim_tokens, count.index)}._domainkey.${var.domains["weavebio"]}"
  type    = "CNAME"
  ttl     = "600"
  value   = "${element(aws_ses_domain_dkim.weavebio.dkim_tokens, count.index)}.dkim.amazonses.com"
}

resource "cloudflare_record" "weavebio-mx-records-10" {
  zone_id  = var.weavebio_cf_id
  name     = var.domains["weavebio"]
  type     = "MX"
  ttl      = "600"
  value    = "inbound-smtp.us-east-1.amazonaws.com"
  priority = "10"
}

resource "cloudflare_record" "weavebio-spf-records" {
  zone_id = var.weavebio_cf_id
  name    = var.domains["weavebio"]
  type    = "TXT"
  ttl     = "600"
  value   = "v=spf1 include:amazonses.com -all"
}