resource "acme_certificate" "biohole_certificate" {
  depends_on                = [var.biohole_cf_id, time_sleep.wait_10_seconds]
  account_key_pem           = "${acme_registration.reg.account_key_pem}"
  common_name               = "${var.domains["biohole"]}"
  subject_alternative_names = ["${var.www_domains["biohole"]}"]

  dns_challenge {
    provider = "cloudflare"

    config = {
      CF_API_EMAIL = var.cloudflare_email
      CF_API_KEY   = var.cloudflare_global_api_key
    }

  }
}

resource "acme_certificate" "desinle_certificate" {
  depends_on                = [var.desinle_cf_id, time_sleep.wait_10_seconds]
  account_key_pem           = "${acme_registration.reg.account_key_pem}"
  common_name               = "${var.domains["desinle"]}"
  subject_alternative_names = ["${var.www_domains["desinle"]}"]

  dns_challenge {
    provider = "cloudflare"

    config = {
      CF_API_EMAIL = var.cloudflare_email
      CF_API_KEY   = var.cloudflare_global_api_key
    }

  }
}


resource "acme_certificate" "liveinspiregrow_certificate" {
  depends_on                = [var.liveinspiregrow_cf_id, time_sleep.wait_10_seconds]
  account_key_pem           = "${acme_registration.reg.account_key_pem}"
  common_name               = "${var.domains["liveinspiregrow"]}"
  subject_alternative_names = ["${var.www_domains["liveinspiregrow"]}"]

  dns_challenge {
    provider = "cloudflare"

    config = {
      CF_API_EMAIL = var.cloudflare_email
      CF_API_KEY   = var.cloudflare_global_api_key
    }

  }
}


resource "acme_certificate" "weavebio_certificate" {
  depends_on                = [var.weavebio_cf_id, time_sleep.wait_10_seconds]
  account_key_pem           = "${acme_registration.reg.account_key_pem}"
  common_name               = "${var.domains["weavebio"]}"
  subject_alternative_names = ["${var.www_domains["weavebio"]}"]

  dns_challenge {
    provider = "cloudflare"

    config = {
      CF_API_EMAIL = var.cloudflare_email
      CF_API_KEY   = var.cloudflare_global_api_key
    }

  }
}


resource "acme_certificate" "machbio_certificate" {
  depends_on                = [var.machbio_cf_id, time_sleep.wait_10_seconds]
  account_key_pem           = "${acme_registration.reg.account_key_pem}"
  common_name               = "${var.domains["machbio"]}"
  subject_alternative_names = ["${var.www_domains["machbio"]}"]

  dns_challenge {
    provider = "cloudflare"

    config = {
      CF_API_EMAIL = var.cloudflare_email
      CF_API_KEY   = var.cloudflare_global_api_key
    }

  }
}

resource "acme_certificate" "xgd_certificate" {
  depends_on                = [var.xgd_cf_id, time_sleep.wait_10_seconds]
  account_key_pem           = "${acme_registration.reg.account_key_pem}"
  common_name               = "${var.domains["xgd"]}"
  subject_alternative_names = ["${var.www_domains["xgd"]}"]

  dns_challenge {
    provider = "cloudflare"

    config = {
      CF_API_EMAIL = var.cloudflare_email
      CF_API_KEY   = var.cloudflare_global_api_key
    }

  }
}