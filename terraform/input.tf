variable "aws_profile" {
  type        = string
  description = "Name of the AWS profile. It's usually in .aws/credentials file in UNIX systems."
}

variable "aws_region" {
  type        = string
  description = "Preferred AWS region."
}

variable "cloudwatch_cronjob_schedule_expression" {
  type        = string
  description = "CloudWatch cronjob event schedule in GMT/UTC"
  # https://docs.aws.amazon.com/AmazonCloudWatch/latest/events/ScheduledEvents.html#CronExpressions
  # cron(Minute Hour DayOfMonth Month DayOfWeek Year) --> UTC/GMT
  default = "0 19 ? * FRI *" # Run at 7:00 pm (UTC) every friday
}

//variable "s3_bucket_and_file_name" {
//  type = object({
//    bucket_name = string
//    json_file_name = string
//  })
//  description = "Name of the S3 bucket where the JSON file will be picked from that contains the phone number"
//}
