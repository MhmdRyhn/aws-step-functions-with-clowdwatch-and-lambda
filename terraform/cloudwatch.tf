resource "aws_cloudwatch_event_rule" "cloudwatch_auto_greeting_event_rule" {
  name = "cloudwatch_auto_greeting_cron_event_rule"
  description = "An event is triggered by cloudwatch at some specific time"
  # https://docs.aws.amazon.com/AmazonCloudWatch/latest/events/ScheduledEvents.html#CronExpressions
  # cron(Minute Hour DayOfMonth Month DayOfWeek Year) --> UTC/GMT
  schedule_expression = "cron(25 15 21 6 ? 2020)"
  role_arn = aws_iam_role.cloudwatch_triggering_step_functions_role.arn
}

resource "aws_cloudwatch_event_target" "cloudwatch_triggering_step_functions" {
  target_id = "run_scheduled_task"
  rule = aws_cloudwatch_event_rule.cloudwatch_auto_greeting_event_rule.name
  arn = aws_sfn_state_machine.auto_greeting_state_machine.id
  role_arn = aws_iam_role.cloudwatch_triggering_step_functions_role.arn
  input = <<EOF
{
  "is_valid": false
}
EOF
}

