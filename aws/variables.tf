variable "domains" {
    type = map
}

variable "www_domains" {
    type = map
}

data "aws_region" "current" {}
data "aws_caller_identity" "current" {}