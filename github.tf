provider "github" {
  token        = "${var.github_token}"
  organization = "desinle"
}

resource "github_repository" "machbio" {
  name        = "machbio"
  description = "website of machbio"
  private     = false
}

resource "github_repository" "desinle" {
  name        = "desinle"
  description = "website of desinle"
  private     = false
}

resource "github_repository" "biohole" {
  name        = "biohole"
  description = "website of biohole"
  private     = false
}

resource "github_repository" "xgd" {
  name        = "xgd"
  description = "website of xgd"
  private     = false
}

resource "github_repository" "liveinspiregrow" {
  name        = "liveinspiregrow"
  description = "website of liveinspiregrow"
  private     = false
}

resource "github_repository" "weavebio" {
  name        = "weavebio"
  description = "website of weavebio"
  private     = false
}