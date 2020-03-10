module "aws" {
  source      = "./aws"
  domains     = var.domains
  www_domains = var.www_domains
}

# module "rancher" {
#   source      = "./rancher"
#   # domains     = var.domains
#   # www_domains = var.www_domains
#   rancher_server_admin_password = var.rancher_server_admin_password
# }