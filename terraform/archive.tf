data "archive_file" "collector_lambda_zip" {
  type = "zip"
  source_dir = "../collector_lambda"
  output_path = "../.archive/collector_lambda.zip"
}

data "archive_file" "sender_lambda_zip" {
  type = "zip"
  source_dir = "../sender_lambda"
  output_path = "../.archive/sender_lambda.zip"
}

