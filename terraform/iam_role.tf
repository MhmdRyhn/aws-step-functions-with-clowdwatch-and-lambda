# ---------- State machine role ---------------
resource "aws_iam_role" "state_machine_role" {
  name = "StateMachineRole"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "states.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": "AutoGreetingStateMachineRole"
    }
  ]
}
EOF
}


# --------------- Basic lambda execution role ------------
resource "aws_iam_role" "basic_lambda_execution_role" {
  name = "BasicLambdaExecutionRole"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": "BasicLambdaExecutionRole"
    }
  ]
}
EOF
}


# ---------------- Lambda S3 access role ----------------
//resource "aws_iam_role" "lambda_s3_readonly_access_role" {
//  name = "LambdaS3AccessRole"
//  assume_role_policy = <<EOF
//{
//  "Version": "2012-10-17",
//  "Statement": [
//    {
//      "Action": "sts:AssumeRole",
//      "Principal": {
//        "Service": "lambda.amazonaws.com"
//      },
//      "Effect": "Allow",
//      "Sid": "LambdaS3AccessRole"
//    }
//  ]
//}
//EOF
//}


//resource "aws_iam_role" "cloudwatch_triggering_step_functions_role" {
//  name = "CloudwatchTriggeringStepFunctionsRole"
//  assume_role_policy = <<EOF
//{
//  "Version": "2012-10-17",
//  "Statement": [
//    {
//      "Action": "sts:AssumeRole",
//      "Principal": {
//        "Service": "cloudwatch.amazonaws.com"
//      },
//      "Effect": "Allow",
//      "Sid": "CloudwatchTriggeringStepFunctionsRole"
//    }
//  ]
//}
//EOF
//}
