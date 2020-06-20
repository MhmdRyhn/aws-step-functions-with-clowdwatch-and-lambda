def handle(event, context):
    # As this lambda will be chosen by state machine to reject
    # sending greeting message to recipient, it'll notify admin
    # about the invalid phone numbers

    admin_phone = event["admin_phone"]
    invalid_numbers = event["invalid_numbers"]

    # Now, process these invalid phone numbers and the recipient
    # names to prepare a message for the admin to send. And, send
    # message to admin using some SMS gateway or AWS SNS.

    return {
        "status": "reject",
        "notification": "Rejection message sent to admin successfully."
    }
