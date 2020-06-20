def handle(event, context):
    # This lambda function will be triggered by a CloudWatch cron-job.

    # Collect a list of BD phone numbers and the recipient name
    # from some file located in an s3 and store in `recipient` variable.
    # You can collect phone numbers from your google contacts.

    # Now, validate the phone numbers. If all the numbers are valid,
    # set value for "action" key as `send` and add "phone_numbers"
    # key in the response and its value is a list if dict as the
    # following format. Invalid phone numbers is collected in
    # the following format too.
    # [{"name": "Rayhan", "phone": "+8801xxxxxxxxx"}]

    # Invalid phone numbers and their names.
    invalid_numbers = [{"name": "Abdullah", "phone": "+8819xxxxxxxx"}]

    # Value for this variable is set based on the validation. It's
    # False if some percentage of phone numbers are invalid, otherwise
    # it's True. It's been sent in event now for simplicity and to check
    # the state machine functionality.
    is_valid = event["is_valid"]

    # Value for this variable will be calculated dynamically.
    recipients = [{"name": "Rayhan", "phone": "+88018xxxxxxxx"}]

    message = event.get("message_body")

    if is_valid:
        response = {
            "action": "send",
            "recipients": recipients,
            "message": message
        }
    else:
        response = {
            "action": "reject",
            "admin_phone": "+88017xxxxxxxx",
            "invalid_numbers": invalid_numbers
        }

    return response

    # Based on the output from this lambda, the state machine will
    # decide whether to proceed next. If action is `send`, it invokes
    # sender_lambda. Otherwise, it invokes rejection_lambda

