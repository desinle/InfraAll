data "aws_iam_policy_document" "emailbucket_ses_permission" {
  statement {
    sid    = "AllowSESPuts"
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["ses.amazonaws.com"]
    }
    actions = [
      "s3:PutObject",
    ]
    resources = [
      "arn:aws:s3:::${var.email-bucket-name}/*",
    ]
    condition {
      test     = "StringEquals"
      variable = "aws:Referer"

      values = [
        data.aws_caller_identity.current.account_id
      ]
    }
  }
}

resource "aws_s3_bucket" "email-bucket" {
  bucket        = var.email-bucket-name
  acl           = "private"
  force_destroy = true
  policy        = data.aws_iam_policy_document.emailbucket_ses_permission.json
}