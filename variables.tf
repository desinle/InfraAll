data "aws_region" "current" {}
data "aws_caller_identity" "current" {}

variable "domains" {
  type = map
  default = {
    "xgd"             = "xgd.in"
    "desinle"         = "desinle.com"
    "machbio"         = "machb.io"
    "biohole"         = "biohole.com"
    "liveinspiregrow" = "liveinspiregrow.com"
    "weavebio"        = "weavebio.com"
  }
}

variable "www_domains" {
  type = map
  default = {
    "xgd"             = "www.xgd.in"
    "desinle"         = "www.desinle.com"
    "machbio"         = "www.machb.io"
    "biohole"         = "www.biohole.com"
    "liveinspiregrow" = "www.liveinspiregrow.com"
    "weavebio"        = "www.weavebio.com"
  }
}

variable "rancher_server_admin_password" {}

variable "github_token" {}