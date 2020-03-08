data "aws_region" "current" {}
data "aws_caller_identity" "current" {}

variable "domains" {
  type = map
  default = {
    "xgd"     = "xgd.in"
    "desinle" = "desinle.com"
    "machbio" = "machb.io"
    "biohole" = "biohole.com"
  }
}

variable "www_domains" {
  type = map
  default = {
    "xgd"     = "www.xgd.in"
    "desinle" = "www.desinle.com"
    "machbio" = "www.machb.io"
    "biohole" = "www.biohole.com"
  }
}