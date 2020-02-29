module "ses" {
  source = "./ses"
  domains = var.domains
  www_domains = var.www_domains
}