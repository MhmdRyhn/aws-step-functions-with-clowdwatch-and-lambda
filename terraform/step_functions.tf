resource "aws_sfn_state_machine" "auto_greeting_state_machine" {
  name = "auto-greeting-state-machine"
  role_arn = aws_iam_role.state_machine_role.arn
  definition = data.template_file.auto_greeting_state_machine_template.rendered
}

data "template_file" "auto_greeting_state_machine_template" {
  template = file("${path.module}/templates/auto-greeting-state-machine.json")
  vars = {
    collector_lambda = aws_lambda_function.collector_lambda.arn
    sender_lambda = aws_lambda_function.sender_lambda.arn
    rejection_lambda = aws_lambda_function.rejection_lambda.arn
  }
}

