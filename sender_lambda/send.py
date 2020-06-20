def handle(event, context):
    # As this lambda will be chosen by state machine to
    # send greeting message to recipient, it'll send the
    # message to all the recipients.

    recipients = event["recipients"]
    message = event["message"]

    # Now, process these recipients' phone numbers, names and
    # message to prepare a message. And, send the message to
    # all the recipients using some SMS gateway or AWS SNS.

    return {
        "status": "success",
        "notification": "Greeting message sent to recipient successfully."
    }
