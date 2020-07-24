module "aws" {
  source      = "./aws"
  domains     = var.domains
  www_domains = var.www_domains

  xgd_cf_id             = module.cloudflare.xgd_cf_id
  desinle_cf_id         = module.cloudflare.desinle_cf_id
  biohole_cf_id         = module.cloudflare.biohole_cf_id
  machbio_cf_id         = module.cloudflare.machbio_cf_id
  liveinspiregrow_cf_id = module.cloudflare.liveinspiregrow_cf_id
  weavebio_cf_id        = module.cloudflare.weavebio_cf_id

  cloudflare_email          = var.cloudflare_email
  cloudflare_global_api_key = var.cloudflare_global_api_key

  biohole_private_key_pem = module.certs.biohole_private_key_pem
  biohole_certificate_pem = module.certs.biohole_certificate_pem
  biohole_issuer_pem      = module.certs.biohole_issuer_pem

  desinle_private_key_pem = module.certs.desinle_private_key_pem
  desinle_certificate_pem = module.certs.desinle_certificate_pem
  desinle_issuer_pem      = module.certs.desinle_issuer_pem

  weavebio_private_key_pem = module.certs.weavebio_private_key_pem
  weavebio_certificate_pem = module.certs.weavebio_certificate_pem
  weavebio_issuer_pem      = module.certs.weavebio_issuer_pem

  liveinspiregrow_private_key_pem = module.certs.liveinspiregrow_private_key_pem
  liveinspiregrow_certificate_pem = module.certs.liveinspiregrow_certificate_pem
  liveinspiregrow_issuer_pem      = module.certs.liveinspiregrow_issuer_pem

  machbio_private_key_pem = module.certs.machbio_private_key_pem
  machbio_certificate_pem = module.certs.machbio_certificate_pem
  machbio_issuer_pem      = module.certs.machbio_issuer_pem

  xgd_private_key_pem = module.certs.xgd_private_key_pem
  xgd_certificate_pem = module.certs.xgd_certificate_pem
  xgd_issuer_pem      = module.certs.xgd_issuer_pem

}

module "cloudflare" {
  source      = "./cloudflare"
  domains     = var.domains
  www_domains = var.www_domains

  desinle_end         = module.aws.desinle
  biohole_end         = module.aws.biohole
  machbio_end         = module.aws.machbio
  xgd_end             = module.aws.xgd
  liveinspiregrow_end = module.aws.liveinspiregrow
  weavebio_end        = module.aws.weavebio

  www_desinle_end         = module.aws.www_desinle
  www_biohole_end         = module.aws.www_biohole
  www_machbio_end         = module.aws.www_machbio
  www_xgd_end             = module.aws.www_xgd
  www_liveinspiregrow_end = module.aws.www_liveinspiregrow
  www_weavebio_end        = module.aws.www_weavebio

}


module "certs" {
  source      = "./certs"
  domains     = var.domains
  www_domains = var.www_domains

  cloudflare_email          = var.cloudflare_email
  cloudflare_global_api_key = var.cloudflare_global_api_key

  xgd_cf_id             = module.cloudflare.xgd_cf_id
  desinle_cf_id         = module.cloudflare.desinle_cf_id
  biohole_cf_id         = module.cloudflare.biohole_cf_id
  machbio_cf_id         = module.cloudflare.machbio_cf_id
  liveinspiregrow_cf_id = module.cloudflare.liveinspiregrow_cf_id
  weavebio_cf_id        = module.cloudflare.weavebio_cf_id

}