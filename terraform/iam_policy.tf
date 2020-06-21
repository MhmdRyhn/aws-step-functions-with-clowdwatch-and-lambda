# --------- Lambda invoke policy ----------------------
data "aws_iam_policy_document" "lambda_invoke_policy_document" {
  statement {
    sid = "LambdaInvokePolicy"
    effect = "Allow"
    resources = ["*"]
    actions = ["lambda:InvokeFunction"]
  }
}

resource "aws_iam_policy" "lambda_invoke_policy" {
  name = "LambdaInvokePolicy"
  path = "/"
  description = "Allow invoking lambda function"
  policy = data.aws_iam_policy_document.lambda_invoke_policy_document.json
}

resource "aws_iam_policy_attachment" "state_machine_lambda_invoke_policy_attachment" {
  name = "StateMachineLambdaInvokePolicyAttachment"
  roles = [aws_iam_role.state_machine_role.name]
  policy_arn = aws_iam_policy.lambda_invoke_policy.arn
}


# -------------- Step functions triggering policy ------------
data "aws_iam_policy_document" "step_functions_triggering_policy_document" {
  statement {
    sid = "StepFunctionsTriggeringPolicy"
    effect = "Allow"
    resources = ["*"]
    actions = ["states:StartExecution"]
  }
}

resource "aws_iam_policy" "step_functions_triggering_policy" {
  name = "StepFunctionsTriggeringPolicy"
  path = "/"
  description = "Allow triggering step functions"
  policy = data.aws_iam_policy_document.step_functions_triggering_policy_document.json
}

resource "aws_iam_policy_attachment" "cloudwatch_step_functions_triggering_policy_attachment" {
  name = "StepFunctionsTriggeringPolicyAttachment"
  roles = [aws_iam_role.cloudwatch_triggering_step_functions_role.name]
  policy_arn = aws_iam_policy.step_functions_triggering_policy.arn
}


# ----------------- S3 access policies ------------------
//data "aws_iam_policy_document" "s3_object_readonly_access_policy_document" {
//  statement {
//    sid = "S3GetObjectReadonlyPolicyDocument"
//    effect = "Allow"
//    resources = ["${data.aws_s3_bucket.s3_bucket.arn}/${var.s3_bucket_and_file_name.json_file_name}"]
//    actions = ["s3:GetObject"]
//  }
//}
//
//resource "aws_iam_policy" "s3_object_readonly_access_policy" {
//  name = "S3ObjectReadonlyPolicy"
//  path = "/"
//  description = "Allow lambda to get object from S3 bucket"
//  policy = data.aws_iam_policy_document.s3_object_readonly_access_policy_document
//}
//
//resource "aws_iam_policy_attachment" "lambda_s3_access_policy_attachment" {
//  name = "LambdaS3GetObjectPolicyAttachment"
//  policy_arn = aws_iam_policy.s3_object_readonly_access_policy
//  roles = [aws_iam_role.lambda_s3_readonly_access_role]
//}

