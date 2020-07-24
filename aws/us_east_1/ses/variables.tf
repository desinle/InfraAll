variable "domains" {
  type = map
}

variable "www_domains" {
  type = map
}

variable "email-bucket-name" {
  default = "desinle-email-bucket"
}

data "aws_region" "current" {}
data "aws_caller_identity" "current" {}

variable "xgd_cf_id" {}
variable "desinle_cf_id" {}
variable "biohole_cf_id" {}
variable "machbio_cf_id" {}
variable "liveinspiregrow_cf_id" {}
variable "weavebio_cf_id" {}
