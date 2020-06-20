resource "aws_lambda_function" "collector_lambda" {
  function_name = "collector_lambda"
  description = "This lambda collect phone number from a JSON file in S3 bucket or from google contact"
  handler = "collect.handle"
  filename = data.archive_file.collector_lambda_zip.output_path
  source_code_hash = data.archive_file.collector_lambda_zip.output_base64sha256
  role = aws_iam_role.basic_lambda_execution_role.arn
  runtime = "python3.6"
  timeout = 10
//  layers = []
}

resource "aws_lambda_function" "sender_lambda" {
  function_name = "sender_lambda"
  description = "This lambda sends message to the phone numbers passed to it in event"
  handler = "send.handle"
  filename = data.archive_file.sender_lambda_zip.output_path
  source_code_hash = data.archive_file.sender_lambda_zip.output_base64sha256
  role = aws_iam_role.basic_lambda_execution_role.arn
  runtime = "python3.6"
  timeout = 10
//  layers = []
}

resource "aws_lambda_function" "rejection_lambda" {
  function_name = "rejection_lambda"
  description = "This lambda sends message to the phone numbers passed to it in event"
  handler = "reject.handle"
  filename = data.archive_file.rejection_lambda_zip.output_path
  source_code_hash = data.archive_file.rejection_lambda_zip.output_base64sha256
  role = aws_iam_role.basic_lambda_execution_role.arn
  runtime = "python3.6"
  timeout = 10
//  layers = []
}

