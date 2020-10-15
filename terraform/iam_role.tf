# ---------- State machine role ---------------
data "aws_iam_policy_document" "state_machine_assume_role_document" {
  statement {
    sid     = "AutoGreetingStateMachineRole"
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      identifiers = ["states.amazonaws.com"]
      type        = "Service"
    }
  }
}

resource "aws_iam_role" "state_machine_role" {
  name               = "StateMachineRole"
  assume_role_policy = data.aws_iam_policy_document.state_machine_assume_role_document.json
}


# --------------- Basic lambda execution role ------------
data "aws_iam_policy_document" "lambda_assume_role_document" {
  statement {
    sid     = "BasicLambdaExecutionRole"
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      identifiers = ["lambda.amazonaws.com"]
      type        = "Service"
    }
  }
}

resource "aws_iam_role" "basic_lambda_execution_role" {
  name               = "BasicLambdaExecutionRole"
  assume_role_policy = data.aws_iam_policy_document.lambda_assume_role_document.json
}


# ------------- CloudWatch role to trigger step functions ---------------
data "aws_iam_policy_document" "cloudwatch_triggering_role_document" {
  statement {
    sid     = "CloudwatchTriggeringStepFunctionsRole"
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      identifiers = ["cloudwatch.amazonaws.com"]
      type        = "Service"
    }
    principals {
      identifiers = ["events.amazonaws.com"]
      type        = "Service"
    }
  }
}

resource "aws_iam_role" "cloudwatch_triggering_step_functions_role" {
  name               = "CloudwatchTriggeringStepFunctionsRole"
  assume_role_policy = data.aws_iam_policy_document.cloudwatch_triggering_role_document.json
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

