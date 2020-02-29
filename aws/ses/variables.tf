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


data "aws_route53_zone" "xgd_zone" {
  name         = var.domains["xgd"]
  private_zone = false
}

data "aws_route53_zone" "desinle_zone" {
  name         = var.domains["desinle"]
  private_zone = false
}

data "aws_route53_zone" "machbio_zone" {
  name         = var.domains["machbio"]
  private_zone = false
}

data "aws_route53_zone" "biohole_zone" {
  name         = var.domains["biohole"]
  private_zone = false
}

variable "xgd_id" {}
variable "biohole_id" {}
variable "machbio_id" {}
variable "desinle_id" {}