module "ses" {
  source = "./ses"
  domains = var.domains
  www_domains = var.www_domains

  depends_on = [aws_route53_zone.xgd_domain, aws_route53_zone.biohole_domain,
   aws_route53_zone.machbio_domain, aws_route53_zone.desinle_domain]
}