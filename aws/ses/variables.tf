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

variable "xgd_id" {}
variable "biohole_id" {}
variable "machbio_id" {}
variable "desinle_id" {}