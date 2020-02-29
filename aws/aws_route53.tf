resource "aws_route53_zone" "xgd_domain" {
  name = var.domains["xgd"]
}

resource "aws_route53_zone" "biohole_domain" {
  name = var.domains["biohole"]
}

resource "aws_route53_zone" "machbio_domain" {
  name = var.domains["machbio"]
}

resource "aws_route53_zone" "desinle_domain" {
  name = var.domains["desinle"]
}
