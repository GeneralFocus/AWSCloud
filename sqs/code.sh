# Get CLI Help
aws sqs help

# List Queues in a Specific Region
aws sqs list-queues --region us-east-1

# Send a Message to a Queue
aws sqs send-message --queue-url https://queue.amazonaws.com/387124123361/MyFirstQueue --region us-east-1 --message-body "hello-wicked-world-lol"

# Receive Messages from a Queue
# Note: This command retrieves up to 10 messages with a visibility timeout of 30 seconds and waits for 20 seconds for new messages.
aws sqs receive-message --region us-east-1 --queue-url https://queue.amazonaws.com/387124123361/MyFirstQueue --max-number-of-messages 10 --visibility-timeout 30 --wait-time-seconds 20

# Delete a Message from a Queue
# Note: Replace <RECEIPT_HANDLE> with the actual receipt handle obtained from the receive-message command.
# This command deletes a message using its receipt handle.
aws sqs delete-message --receipt-handle <RECEIPT_HANDLE> --queue-url https://queue.amazonaws.com/387124123361/MyFirstQueue --region us-east-1
