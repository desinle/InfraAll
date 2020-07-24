module "us_east_1" {
  source      = "./us_east_1"
  domains     = var.domains
  www_domains = var.www_domains

  xgd_cf_id             = var.xgd_cf_id
  desinle_cf_id         = var.desinle_cf_id
  biohole_cf_id         = var.biohole_cf_id
  machbio_cf_id         = var.machbio_cf_id
  liveinspiregrow_cf_id = var.liveinspiregrow_cf_id
  weavebio_cf_id        = var.weavebio_cf_id

  cloudflare_email          = var.cloudflare_email
  cloudflare_global_api_key = var.cloudflare_global_api_key

  biohole_private_key_pem = var.biohole_private_key_pem
  biohole_certificate_pem = var.biohole_certificate_pem
  biohole_issuer_pem      = var.biohole_issuer_pem

  desinle_private_key_pem = var.desinle_private_key_pem
  desinle_certificate_pem = var.desinle_certificate_pem
  desinle_issuer_pem      = var.desinle_issuer_pem

  weavebio_private_key_pem = var.weavebio_private_key_pem
  weavebio_certificate_pem = var.weavebio_certificate_pem
  weavebio_issuer_pem      = var.weavebio_issuer_pem

  liveinspiregrow_private_key_pem = var.liveinspiregrow_private_key_pem
  liveinspiregrow_certificate_pem = var.liveinspiregrow_certificate_pem
  liveinspiregrow_issuer_pem      = var.liveinspiregrow_issuer_pem

  machbio_private_key_pem = var.machbio_private_key_pem
  machbio_certificate_pem = var.machbio_certificate_pem
  machbio_issuer_pem      = var.machbio_issuer_pem

  xgd_private_key_pem = var.xgd_private_key_pem
  xgd_certificate_pem = var.xgd_certificate_pem
  xgd_issuer_pem      = var.xgd_issuer_pem

}