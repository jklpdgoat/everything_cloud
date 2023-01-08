import boto3

# Get the service resource
sqs = boto3.resource('sqs')

# Create the queue, This returns an SQS.Queue instance
# queue = sqs.create_queue(QueueName='sqstest', Attributes={'DelaySeconds': '5'})

# Get the queue
queue = sqs.get_queue_by_name(QueueName='sqstestx')

# # Create a new message
# response = queue.send_message(MessageBody='world')

response = queue.send_message(MessageBody='boto_daniel', MessageAttributes={
    'Author': {
        'StringValue': 'Daniel The Fak?!',
        'DataType': 'String'
    }
})

response = queue.send_messages(Entries=[
    {
        'Id': '1',
        'MessageBody': 'world3'
    },
    {
        'Id': '2',
        'MessageBody': 'boto_tree',
        'MessageAttributes': {
            'Author': {
                'StringValue': 'Jar',
                'DataType': 'String'
            }
        }
    }
])

# # You can now access identifiers and attributes
# print(queue.url)
# print(queue.attributes.get('DelaySeconds'))

# for queue in sqs.queues.all():
#     print(queue.url)

# print(response.get('MessageId'))
# print(response.get('MessageBody'))
# print(response2.get('MessageBody'))
# print(response3.get('MessageBody'))

print(response.get('Failed'))

# Process messages by printing out body and optional author name
for message in queue.receive_messages(MessageAttributeNames=['Author']):
    # Get the custom author message attribute if it was set
    author_text = ''
    if message.message_attributes is not None:
        author_name = message.message_attributes.get('Author').get('StringValue')
        if author_name:
            author_text = ' ({0})'.format(author_name)

    # Print out the body and author (if set)
    print('Hello, {0}!{1}'.format(message.body, author_text))

    # Let the queue know that the message is processed
    message.delete()
