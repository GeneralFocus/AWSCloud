#!/bin/bash

# Display AWS CLI version
aws --version

# AWS Kinesis Producer Actions

# AWS CLI v2 Put Record
aws kinesis put-record \
  --stream-name test \
  --partition-key user1 \
  --data "user signup" \
  --cli-binary-format raw-in-base64-out

# AWS CLI v1 Put Record
aws kinesis put-record \
  --stream-name test \
  --partition-key user1 \
  --data "user signup"

# AWS Kinesis Consumer Actions

# Describe the Stream
aws kinesis describe-stream --stream-name test

# Get Shard Iterator
shard_iterator=$(aws kinesis get-shard-iterator \
  --stream-name test \
  --shard-id shardId-000000000000 \
  --shard-iterator-type TRIM_HORIZON \
  --query 'ShardIterator')

# Get Records using the obtained shard iterator
aws kinesis get-records --shard-iterator "$shard_iterator"
