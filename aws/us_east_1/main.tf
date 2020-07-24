module "ses" {
  source      = "./ses"
  domains     = var.domains
  www_domains = var.www_domains

  xgd_cf_id             = var.xgd_cf_id
  desinle_cf_id         = var.desinle_cf_id
  biohole_cf_id         = var.biohole_cf_id
  machbio_cf_id         = var.machbio_cf_id
  liveinspiregrow_cf_id = var.liveinspiregrow_cf_id
  weavebio_cf_id        = var.weavebio_cf_id

}