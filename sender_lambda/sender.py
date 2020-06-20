def handle(event, context):
    if event["from"] == "collector_lambda":
        return {"response": "from collector_lambda"}
    return {"response": "from another lambda"}
