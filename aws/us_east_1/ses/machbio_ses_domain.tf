resource "cloudflare_record" "machbio-domain-identity-records" {
  zone_id = var.machbio_cf_id
  name    = "_amazonses.${var.domains["machbio"]}"
  type    = "TXT"
  ttl     = "600"
  value   = aws_ses_domain_identity.machbio.verification_token
}

resource "cloudflare_record" "machbio-dkim-records" {
  count   = 3
  zone_id = var.machbio_cf_id
  name    = "${element(aws_ses_domain_dkim.machbio.dkim_tokens, count.index)}._domainkey.${var.domains["machbio"]}"
  type    = "CNAME"
  ttl     = "600"
  value   = "${element(aws_ses_domain_dkim.machbio.dkim_tokens, count.index)}.dkim.amazonses.com"
}

resource "cloudflare_record" "machbio-mx-records-10" {
  zone_id  = var.machbio_cf_id
  name     = var.domains["machbio"]
  type     = "MX"
  ttl      = "600"
  value    = "inbound-smtp.us-east-1.amazonaws.com"
  priority = "10"
}

resource "cloudflare_record" "machbio-spf-records" {
  zone_id = var.machbio_cf_id
  name    = var.domains["machbio"]
  type    = "TXT"
  ttl     = "600"
  value   = "v=spf1 include:amazonses.com -all"
}