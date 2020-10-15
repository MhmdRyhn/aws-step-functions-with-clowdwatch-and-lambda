resource "aws_cloudwatch_event_rule" "cloudwatch_auto_greeting_event_rule" {
  name                = "cloudwatch_auto_greeting_cron_event_rule"
  description         = "A step function is triggered with an event by cloudwatch at some specific time"
  schedule_expression = "cron(${var.cloudwatch_cronjob_schedule_expression})"
  role_arn            = aws_iam_role.cloudwatch_triggering_step_functions_role.arn
}

resource "aws_cloudwatch_event_target" "cloudwatch_triggering_step_functions" {
  target_id = "run_scheduled_task"
  rule      = aws_cloudwatch_event_rule.cloudwatch_auto_greeting_event_rule.name
  arn       = aws_sfn_state_machine.auto_greeting_state_machine.id
  role_arn  = aws_iam_role.cloudwatch_triggering_step_functions_role.arn
  input     = <<EOF
{
  "is_valid": false
}
EOF
}

