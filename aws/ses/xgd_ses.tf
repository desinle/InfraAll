resource "aws_ses_domain_identity" "xgd" {
  domain = var.domains["xgd"]
}

resource "aws_route53_record" "xgd-domain-identity-records" {
  zone_id = var.xgd_id
  name    = "_amazonses.${var.domains["xgd"]}"
  type    = "TXT"
  ttl     = "600"

  records = [
    "${aws_ses_domain_identity.xgd.verification_token}",
  ]
}

resource "aws_ses_domain_dkim" "xgd" {
  domain = aws_ses_domain_identity.xgd.domain
}

resource "aws_route53_record" "xgd-dkim-records" {
  count   = 3
  zone_id = var.xgd_id
  name    = "${element(aws_ses_domain_dkim.xgd.dkim_tokens, count.index)}._domainkey.${var.domains["xgd"]}"
  type    = "CNAME"
  ttl     = "600"

  records = [
    "${element(aws_ses_domain_dkim.xgd.dkim_tokens, count.index)}.dkim.amazonses.com",
  ]
}

resource "aws_route53_record" "xgd-mx-records" {
  zone_id = var.xgd_id
  name    = "${var.domains["xgd"]}"
  type    = "MX"
  ttl     = "600"

  records = [
    "10 inbound-smtp.us-east-1.amazonaws.com",
    "10 inbound-smtp.us-east-1.amazonaws.com",
  ]
}

resource "aws_route53_record" "xgd-spf-records" {
  zone_id = var.xgd_id
  name    = "${var.domains["xgd"]}"
  type    = "TXT"
  ttl     = "600"

  records = [
    "v=spf1 include:amazonses.com -all",
  ]
}


resource "aws_ses_receipt_rule_set" "xgd" {
  rule_set_name = "xgd_receive_all"
}

resource "aws_ses_active_receipt_rule_set" "xgd" {
  rule_set_name = "${aws_ses_receipt_rule_set.xgd.rule_set_name}"

  depends_on = [
    aws_ses_receipt_rule.xgd
  ]
}

resource "aws_ses_receipt_rule" "xgd" {
  name          = "xgd"
  rule_set_name = "${aws_ses_receipt_rule_set.xgd.rule_set_name}"

  recipients = [
    "${var.domains["xgd"]}",
  ]

  enabled      = true
  scan_enabled = true
  tls_policy   = "Require"

  s3_action {
    bucket_name       = "${aws_s3_bucket.email-bucket.bucket}"
    object_key_prefix = var.domains["xgd"]
    position          = 1
  }

  stop_action {
    scope    = "RuleSet"
    position = 2
  }

  depends_on = [aws_s3_bucket.email-bucket]
}

# resource "aws_sns_topic" "xgd-email" {
#   name = "xgd-email"
# }

# resource "aws_cloudwatch_log_group" "xgd-receive-email" {
#   name              = "/aws/lambda/xgd_receive_mail"
#   retention_in_days = 1
# }
#
# resource "aws_iam_role_policy_attachment" "lambda_logs" {
#   role = "${aws_iam_role.iam_for_lambda.name}"
#   policy_arn = "${aws_iam_policy.lambda_logging.arn}"
# }

# resource "aws_lambda_function" "xgd_receive_mail" {
#   role             = "${aws_iam_role.iam_for_lambda.arn}"
#   handler          = "index.handler"
#   runtime          = "python3.6"
#   filename         = "${data.archive_file.xgd_receive_mail.output_path}"
#   function_name    = "xgd_receive_mail"
#   source_code_hash = "${filebase64sha256(data.archive_file.xgd_receive_mail.output_path)}"
#   depends_on    = ["aws_iam_role_policy_attachment.lambda_logs", "aws_cloudwatch_log_group.xgd-receive-email"]
# }

# resource "aws_lambda_permission" "sns_notify_ms_receive" {
#   statement_id  = "AllowExecutionFromSNS"
#   action        = "lambda:InvokeFunction"
#   function_name = "${aws_lambda_function.xgd_receive_mail.function_name}"
#   principal     = "sns.amazonaws.com"
#   source_arn    = "${aws_sns_topic.xgd-email.arn}"
# }