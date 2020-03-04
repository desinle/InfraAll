# module "ses" {
#   source = "./ses"
#   domains = var.domains
#   www_domains = var.www_domains

#   xgd_id = aws_route53_zone.xgd_domain.zone_id
#   biohole_id = aws_route53_zone.biohole_domain.zone_id
#   desinle_id = aws_route53_zone.desinle_domain.zone_id
#   machbio_id = aws_route53_zone.machbio_domain.zone_id
# }