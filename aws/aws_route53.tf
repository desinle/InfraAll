resource "aws_route53_zone" "xgd_domain" {
  name = var.domains["xgd"]
}

data "dns_ns_record_set" "xgd" {
  host = var.domains["xgd"]
}

resource "aws_route53_record" "xgd_domain" {
  allow_overwrite = true
  name            = var.domains["xgd"]
  ttl             = 30
  type            = "NS"
  zone_id         = "${aws_route53_zone.xgd_domain.zone_id}"

  records = [
    "${data.dns_ns_record_set.xgd.nameservers.0}",
    "${data.dns_ns_record_set.xgd.nameservers.1}",
    "${data.dns_ns_record_set.xgd.nameservers.2}",
    "${data.dns_ns_record_set.xgd.nameservers.3}",
  ]
}

###


resource "aws_route53_zone" "biohole_domain" {
  name = var.domains["biohole"]
}

data "dns_ns_record_set" "biohole" {
  host = var.domains["biohole"]
}

resource "aws_route53_record" "biohole_domain" {
  allow_overwrite = true
  name            = var.domains["biohole"]
  ttl             = 30
  type            = "NS"
  zone_id         = "${aws_route53_zone.biohole_domain.zone_id}"

  records = [
    "${data.dns_ns_record_set.biohole.nameservers.0}",
    "${data.dns_ns_record_set.biohole.nameservers.1}",
    "${data.dns_ns_record_set.biohole.nameservers.2}",
    "${data.dns_ns_record_set.biohole.nameservers.3}",
  ]
}

###

resource "aws_route53_zone" "machbio_domain" {
  name = var.domains["machbio"]
}

data "dns_ns_record_set" "machbio" {
  host = var.domains["machbio"]
}

resource "aws_route53_record" "machbio_domain" {
  allow_overwrite = true
  name            = var.domains["machbio"]
  ttl             = 30
  type            = "NS"
  zone_id         = "${aws_route53_zone.machbio_domain.zone_id}"

  records = [
    "${data.dns_ns_record_set.machbio.nameservers.0}",
    "${data.dns_ns_record_set.machbio.nameservers.1}",
    "${data.dns_ns_record_set.machbio.nameservers.2}",
    "${data.dns_ns_record_set.machbio.nameservers.3}",
  ]
}

###

resource "aws_route53_zone" "desinle_domain" {
  name = var.domains["desinle"]
}

data "dns_ns_record_set" "desinle" {
  host = var.domains["desinle"]
}


resource "aws_route53_record" "desinle_domain" {
  allow_overwrite = true
  name            = var.domains["desinle"]
  ttl             = 30
  type            = "NS"
  zone_id         = "${aws_route53_zone.desinle_domain.zone_id}"

  records = [
    "${data.dns_ns_record_set.desinle.nameservers.0}",
    "${data.dns_ns_record_set.desinle.nameservers.1}",
    "${data.dns_ns_record_set.desinle.nameservers.2}",
    "${data.dns_ns_record_set.desinle.nameservers.3}",
  ]
}

resource "aws_route53_record" "desinle_keybase" {
  zone_id = "${aws_route53_zone.desinle_domain.zone_id}"
  name            = var.domains["desinle"]
  type    = "TXT"
  ttl     = "300"
  records = ["keybase-site-verification=IFVdF0S5_GdT7o2t0JVowlQ5KAko7lsU98bhLQgRiXY"]
}

###