variable "infra_email" {}
variable "cloudflare_email" {}
variable "do_token" {}

variable "aws_access_key" {}
variable "aws_secret_key" {}

variable "cloudflare_global_api_key" {}
variable "cloudflare_ca_key" {}

### Digital Ocean Providers
provider "digitalocean" {
  token = var.do_token
}

### AWS
provider "aws" {
  region     = "us-east-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

provider "aws" {
  alias      = "uswest1"
  region     = "us-west-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

### Cloudflare 
provider "cloudflare" {
  email                = var.cloudflare_email
  api_key              = var.cloudflare_global_api_key
  api_user_service_key = var.cloudflare_ca_key
}