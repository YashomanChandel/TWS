#!/bin/bash

echo "Print the info of s3 buckets" > tracker_output.txt
aws s3 ls >> tracker_output.txt
echo "Print the info of ec2 instances" >> tracker_output.txt
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId' >> tracker_output.txt
echo "Print the info of IAM users" >> tracker_output.txt
aws iam list-users >> tracker_output.txt
echo "Print the info of lambda functions" >> tracker_output.txt
aws lambda list-functions >> tracker_output.txt

