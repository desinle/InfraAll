variable "domains" {
  type = map
}

variable "www_domains" {
  type = map
}

data "aws_region" "current" {}
data "aws_caller_identity" "current" {}

variable "xgd_cf_id" {}
variable "desinle_cf_id" {}
variable "biohole_cf_id" {}
variable "machbio_cf_id" {}
variable "liveinspiregrow_cf_id" {}
variable "weavebio_cf_id" {}

variable "cloudflare_email" {}
variable "cloudflare_global_api_key" {}

variable "biohole_private_key_pem" {}
variable "biohole_certificate_pem" {}
variable "biohole_issuer_pem" {}
variable "desinle_private_key_pem" {}
variable "desinle_certificate_pem" {}
variable "desinle_issuer_pem" {}
variable "weavebio_private_key_pem" {}
variable "weavebio_certificate_pem" {}
variable "weavebio_issuer_pem" {}
variable "liveinspiregrow_private_key_pem" {}
variable "liveinspiregrow_certificate_pem" {}
variable "liveinspiregrow_issuer_pem" {}
variable "machbio_private_key_pem" {}
variable "machbio_certificate_pem" {}
variable "machbio_issuer_pem" {}
variable "xgd_private_key_pem" {}
variable "xgd_certificate_pem" {}
variable "xgd_issuer_pem" {}