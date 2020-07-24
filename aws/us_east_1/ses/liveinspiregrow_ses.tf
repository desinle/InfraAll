resource "aws_ses_domain_identity" "liveinspiregrow" {
  domain = var.domains["liveinspiregrow"]
}

resource "aws_ses_domain_dkim" "liveinspiregrow" {
  domain = aws_ses_domain_identity.liveinspiregrow.domain
}


resource "aws_ses_receipt_rule_set" "liveinspiregrow" {
  rule_set_name = "liveinspiregrow_receive_all"
}

resource "aws_ses_active_receipt_rule_set" "liveinspiregrow" {
  rule_set_name = aws_ses_receipt_rule_set.liveinspiregrow.rule_set_name

  depends_on = [
    aws_ses_receipt_rule.liveinspiregrow
  ]
}

resource "aws_ses_receipt_rule" "liveinspiregrow" {
  name          = "liveinspiregrow"
  rule_set_name = aws_ses_receipt_rule_set.liveinspiregrow.rule_set_name

  recipients = [
    "${var.domains["liveinspiregrow"]}",
  ]

  enabled      = true
  scan_enabled = true
  tls_policy   = "Require"

  s3_action {
    bucket_name       = aws_s3_bucket.email-bucket.bucket
    object_key_prefix = var.domains["liveinspiregrow"]
    position          = 1
  }

  stop_action {
    scope    = "RuleSet"
    position = 2
  }

  depends_on = [aws_s3_bucket.email-bucket]
}

# resource "aws_sns_topic" "liveinspiregrow-email" {
#   name = "liveinspiregrow-email"
# }

# resource "aws_cloudwatch_log_group" "liveinspiregrow-receive-email" {
#   name              = "/aws/lambda/liveinspiregrow_receive_mail"
#   retention_in_days = 1
# }
#
# resource "aws_iam_role_policy_attachment" "lambda_logs" {
#   role = "${aws_iam_role.iam_for_lambda.name}"
#   policy_arn = "${aws_iam_policy.lambda_logging.arn}"
# }

# resource "aws_lambda_function" "liveinspiregrow_receive_mail" {
#   role             = "${aws_iam_role.iam_for_lambda.arn}"
#   handler          = "index.handler"
#   runtime          = "python3.6"
#   filename         = "${data.archive_file.liveinspiregrow_receive_mail.output_path}"
#   function_name    = "liveinspiregrow_receive_mail"
#   source_code_hash = "${filebase64sha256(data.archive_file.liveinspiregrow_receive_mail.output_path)}"
#   depends_on    = ["aws_iam_role_policy_attachment.lambda_logs", "aws_cloudwatch_log_group.liveinspiregrow-receive-email"]
# }

# resource "aws_lambda_permission" "sns_notify_ms_receive" {
#   statement_id  = "AllowExecutionFromSNS"
#   action        = "lambda:InvokeFunction"
#   function_name = "${aws_lambda_function.liveinspiregrow_receive_mail.function_name}"
#   principal     = "sns.amazonaws.com"
#   source_arn    = "${aws_sns_topic.liveinspiregrow-email.arn}"
# }