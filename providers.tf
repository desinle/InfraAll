variable "infra_email" {}
variable "do_token" {}

variable "aws_access_key" {}
variable "aws_secret_key" {}


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
