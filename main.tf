module "aws" {
  source      = "./aws"
  domains     = var.domains
  www_domains = var.www_domains
}