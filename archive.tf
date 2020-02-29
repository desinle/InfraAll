data "archive_file" "print_lambda_archive" {
  type        = "zip"
  source_file = "${path.module}/repos/print_lambda/index.py"
  output_path = "${path.module}/print_lambda.zip"
}