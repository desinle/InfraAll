module "aws" {
  source      = "./aws"
  domains     = var.domains
  www_domains = var.www_domains
}

module "do" {
  source      = "./do"
  # domains     = var.domains
  # www_domains = var.www_domains
  rancher_server_admin_password = var.rancher_server_admin_password
}