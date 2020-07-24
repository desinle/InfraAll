variable "domains" {
  type = map
}

variable "www_domains" {
  type = map
}

variable "cloudflare_email" {}
variable "cloudflare_global_api_key" {}
variable "ssl_email" {
  default = "desinle+ssl@gmail.com"
}

variable "xgd_cf_id" {}
variable "desinle_cf_id" {}
variable "biohole_cf_id" {}
variable "machbio_cf_id" {}
variable "liveinspiregrow_cf_id" {}
variable "weavebio_cf_id" {}

resource "null_resource" "previous" {}

resource "time_sleep" "wait_10_seconds" {
  depends_on      = [null_resource.previous]
  create_duration = "10s"
}