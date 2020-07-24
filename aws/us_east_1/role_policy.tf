data "aws_iam_policy_document" "lambda_logging" {
  statement {
    sid    = "AllowLambdaLogging"
    effect = "Allow"
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]
    resources = [
      "arn:aws:logs:*:*:*",
    ]
  }
}

resource "aws_iam_policy" "lambda_logging" {
  name   = "lambda_logging"
  path   = "/"
  policy = data.aws_iam_policy_document.lambda_logging.json
}
