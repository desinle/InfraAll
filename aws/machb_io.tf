resource "aws_acm_certificate" "machbio_certificate" {
  domain_name               = var.domains["machbio"]
  validation_method         = "DNS"
  subject_alternative_names = ["*.${var.domains["machbio"]}"]
}

resource "aws_route53_record" "machbio_cert_validation" {
  name    = aws_acm_certificate.machbio_certificate.domain_validation_options.0.resource_record_name
  type    = aws_acm_certificate.machbio_certificate.domain_validation_options.0.resource_record_type
  zone_id = aws_route53_zone.desinle_domain.zone_id
  records = ["${aws_acm_certificate.machbio_certificate.domain_validation_options.0.resource_record_value}"]
  ttl     = 60
}

output "machbio_fqdn" {
  value = aws_route53_record.machbio_cert_validation.fqdn
}

# resource "aws_acm_certificate_validation" "machbio_cert" {
#   certificate_arn         = aws_acm_certificate.machbio_certificate.arn
#   validation_record_fqdns = ["${aws_route53_record.machbio_cert_validation.fqdn}"]
# }

#######

# data "aws_iam_policy_document" "machbio_allows3get" {
#   statement {
#     sid    = "GetS3ObjectContent"
#     effect = "Allow"
#     principals {
#       type        = "*"
#       identifiers = ["*"]
#     }
#     actions = [
#       "s3:GetObject",
#     ]
#     resources = [
#       "arn:aws:s3:::${var.domains["machbio"]}/*",
#     ]
#   }
# }

# resource "aws_s3_bucket" "machbio" {
#   bucket = var.domains["machbio"]
#   acl    = "public-read"
#   policy = data.aws_iam_policy_document.machbio_allows3get.json

#   website {
#     index_document = "index.html"
#     error_document = "404.html"
#   }

#   cors_rule {
#     allowed_headers = ["*"]
#     allowed_methods = ["GET", "PUT", "POST", "HEAD"]
#     allowed_origins = ["*"]
#     expose_headers  = ["ETag", "Content-Length", "Content-Type", "Date", "x-amz-id-2", "x-amz-request-id"]
#     max_age_seconds = 3000
#   }

# }

# resource "aws_s3_bucket" "www_machbio" {
#   bucket = var.www_domains["machbio"]

#   website {
#     redirect_all_requests_to = aws_s3_bucket.machbio.website_endpoint
#   }

# }

# resource "aws_cloudfront_distribution" "machbio_distribution" {
#   origin {
#     custom_origin_config {
#       http_port              = "80"
#       https_port             = "443"
#       origin_protocol_policy = "http-only"
#       origin_ssl_protocols   = ["TLSv1", "TLSv1.1", "TLSv1.2"]
#     }
#     domain_name = "${aws_s3_bucket.machbio.website_endpoint}"
#     origin_id   = "${var.domains["machbio"]}"
#   }

#   enabled             = true
#   is_ipv6_enabled     = true
#   default_root_object = "index.html"

#   default_cache_behavior {
#     viewer_protocol_policy = "redirect-to-https"
#     compress               = true
#     allowed_methods        = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
#     cached_methods         = ["GET", "HEAD"]
#     target_origin_id       = "${var.domains["machbio"]}"
#     min_ttl                = 0
#     default_ttl            = 86400
#     max_ttl                = 31536000

#     forwarded_values {
#       query_string = false
#       cookies {
#         forward = "none"
#       }
#     }
#   }

#   aliases = ["${var.domains["machbio"]}", "${var.www_domains["machbio"]}"]

#   restrictions {
#     geo_restriction {
#       restriction_type = "none"
#     }
#   }
#   price_class = "PriceClass_100"
#   viewer_certificate {
#     acm_certificate_arn = aws_acm_certificate_validation.machbio_cert.certificate_arn
#     ssl_support_method  = "sni-only"
#   }
# }

# resource "aws_route53_record" "www_machbio" {
#   zone_id = "${aws_route53_zone.desinle_domain.zone_id}"
#   name    = "${var.www_domains["machbio"]}"
#   type    = "A"

#   alias {
#     name                   = "${aws_cloudfront_distribution.machbio_distribution.domain_name}"
#     zone_id                = "${aws_cloudfront_distribution.machbio_distribution.hosted_zone_id}"
#     evaluate_target_health = false
#   }
# }

# resource "aws_route53_record" "root_machbio" {
#   zone_id = "${aws_route53_zone.desinle_domain.zone_id}"

#   name = ""
#   type = "A"

#   alias {
#     name                   = "${aws_cloudfront_distribution.machbio_distribution.domain_name}"
#     zone_id                = "${aws_cloudfront_distribution.machbio_distribution.hosted_zone_id}"
#     evaluate_target_health = false
#   }
# }
