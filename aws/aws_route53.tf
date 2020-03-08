resource "aws_route53_zone" "xgd_domain" {
  name = var.domains["xgd"]
}

resource "aws_route53_record" "xgd_domain" {
  allow_overwrite = true
  name            = var.domains["xgd"]
  ttl             = 30
  type            = "NS"
  zone_id         = "${aws_route53_zone.xgd_domain.zone_id}"

  records = [
    "ns-1463.awsdns-54.org",
    "ns-683.awsdns-21.net",
    "ns-1819.awsdns-35.co.uk",
    "ns-226.awsdns-28.com",
  ]
}

###


resource "aws_route53_zone" "biohole_domain" {
  name = var.domains["biohole"]
}

resource "aws_route53_record" "biohole_domain" {
  allow_overwrite = true
  name            = var.domains["biohole"]
  ttl             = 30
  type            = "NS"
  zone_id         = "${aws_route53_zone.biohole_domain.zone_id}"

  records = [
    "ns-919.awsdns-50.net",
    "ns-347.awsdns-43.com",
    "ns-1567.awsdns-03.co.uk",
    "ns-1364.awsdns-42.org",
  ]
}

###

resource "aws_route53_zone" "machbio_domain" {
  name = var.domains["machbio"]
}

resource "aws_route53_record" "machbio_domain" {
  allow_overwrite = true
  name            = var.domains["machbio"]
  ttl             = 30
  type            = "NS"
  zone_id         = "${aws_route53_zone.machbio_domain.zone_id}"

  records = [
    "ns-545.awsdns-04.net",
    "ns-1343.awsdns-39.org",
    "ns-1704.awsdns-21.co.uk",
    "ns-371.awsdns-46.com",
  ]
}

###

resource "aws_route53_zone" "desinle_domain" {
  name = var.domains["desinle"]
}

resource "aws_route53_record" "desinle_domain" {
  allow_overwrite = true
  name            = var.domains["desinle"]
  ttl             = 30
  type            = "NS"
  zone_id         = "${aws_route53_zone.desinle_domain.zone_id}"

  records = [
    "ns-864.awsdns-44.net",
    "ns-212.awsdns-26.com",
    "ns-1385.awsdns-45.org",
    "ns-1908.awsdns-46.co.uk",
  ]
}

resource "aws_route53_record" "desinle_keybase" {
  zone_id = "${aws_route53_zone.desinle_domain.zone_id}"
  name    = var.domains["desinle"]
  type    = "TXT"
  ttl     = "300"
  records = ["keybase-site-verification=IFVdF0S5_GdT7o2t0JVowlQ5KAko7lsU98bhLQgRiXY"]
}

###