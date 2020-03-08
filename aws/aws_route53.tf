resource "aws_route53_zone" "xgd_domain" {
  name = var.domains["xgd"]
}

###

resource "aws_route53_zone" "biohole_domain" {
  name = var.domains["biohole"]
}

###

resource "aws_route53_zone" "machbio_domain" {
  name = var.domains["machbio"]
}

###

resource "aws_route53_zone" "desinle_domain" {
  name = var.domains["desinle"]
}

resource "aws_route53_record" "desinle_keybase" {
  zone_id = "${aws_route53_zone.desinle_domain.zone_id}"
  name    = var.domains["desinle"]
  type    = "TXT"
  ttl     = "300"
  records = ["keybase-site-verification=IFVdF0S5_GdT7o2t0JVowlQ5KAko7lsU98bhLQgRiXY"]
}

###