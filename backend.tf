terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "desinle"

    workspaces {
      name = "InfraAll"
    }
  }
}
