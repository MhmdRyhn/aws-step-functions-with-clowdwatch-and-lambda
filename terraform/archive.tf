data "archive_file" "collector_lambda_zip" {
  type        = "zip"
  source_dir  = "../lambdas/collector_lambda"
  output_path = "../.archive/collector_lambda.zip"
}

data "archive_file" "sender_lambda_zip" {
  type        = "zip"
  source_dir  = "../lambdas/sender_lambda"
  output_path = "../.archive/sender_lambda.zip"
}

data "archive_file" "rejection_lambda_zip" {
  type        = "zip"
  source_dir  = "../lambdas/rejection_lambda"
  output_path = "../.archive/rejection_lambda.zip"
}

