import json

def lambda_handler(event, context):
    try:
        # Your logic to process event data or perform operations goes here

        # For example, generating a dynamic message based on the input event
        dynamic_message = f"Hello, {event.get('name')} from Lambda!" if 'name' in event else "Hello from Lambda!"

        body = {
            "message": dynamic_message,
            "additional_data": "Some additional information",
        }
        statusCode = 200
    except Exception as e:
        statusCode = 500
        body = {"error": str(e)}

    return {
        "statusCode": statusCode,
        "body": json.dumps(body),
        "headers": {
            "Content-Type": "application/json"
        }
    }
