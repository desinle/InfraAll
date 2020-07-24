data "aws_iam_policy_document" "weavebio_allows3get" {
  statement {
    sid    = "GetS3ObjectContent"
    effect = "Allow"
    principals {
      type        = "*"
      identifiers = ["*"]
    }
    actions = [
      "s3:GetObject",
    ]
    resources = [
      "arn:aws:s3:::${var.domains["weavebio"]}/*",
    ]
  }
}

resource "aws_s3_bucket" "weavebio" {
  bucket = var.domains["weavebio"]
  acl    = "public-read"
  policy = data.aws_iam_policy_document.weavebio_allows3get.json

  website {
    index_document = "index.html"
    error_document = "404.html"
  }

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET", "PUT", "POST", "HEAD"]
    allowed_origins = ["*"]
    expose_headers  = ["ETag", "Content-Length", "Content-Type", "Date", "x-amz-id-2", "x-amz-request-id"]
    max_age_seconds = 3000
  }

}

resource "aws_s3_bucket" "www_weavebio" {
  bucket = var.www_domains["weavebio"]

  website {
    redirect_all_requests_to = aws_s3_bucket.weavebio.website_endpoint
  }

}

resource "aws_cloudfront_distribution" "weavebio_distribution" {
  origin {
    custom_origin_config {
      http_port              = "80"
      https_port             = "443"
      origin_protocol_policy = "http-only"
      origin_ssl_protocols   = ["TLSv1", "TLSv1.1", "TLSv1.2"]
    }
    domain_name = aws_s3_bucket.weavebio.website_endpoint
    origin_id   = var.domains["weavebio"]
  }

  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = "index.html"

  default_cache_behavior {
    viewer_protocol_policy = "redirect-to-https"
    compress               = true
    allowed_methods        = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = var.domains["weavebio"]
    min_ttl                = 0
    default_ttl            = 86400
    max_ttl                = 31536000

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }
  }

  aliases = ["${var.domains["weavebio"]}", "${var.www_domains["weavebio"]}"]

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
  price_class = "PriceClass_100"
  viewer_certificate {
    acm_certificate_arn = aws_acm_certificate.weavebio_cert.arn
    ssl_support_method  = "sni-only"
  }
}

resource "aws_acm_certificate" "weavebio_cert" {
  private_key       = var.weavebio_private_key_pem
  certificate_body  = var.weavebio_certificate_pem
  certificate_chain = var.weavebio_issuer_pem

  lifecycle {
    create_before_destroy = true
  }
}