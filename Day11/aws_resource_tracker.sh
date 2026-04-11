#!/bin/bash

############################################################
# Author: Deepali
# Date: 11 APR 2026
# Script Name: aws-resource-tracker.sh
# Purpose: Generate a daily usage report of AWS resources
# Version: v1.0
############################################################

set -x

#AWS S3
#AWS EC2
#AWS Lambda
#AWS IAM Users

#rm resourceTracker

echo "AWS Resource Report - $(date)" > resourceTracker

# Listing AWS S3 Buckets
echo "Print list of S3 buckets"
echo "===== S3 Buckets =====" >> resourceTracker
aws s3 ls > resourceTracker

# Listing EC2 Instances
echo "Print list of EC2 instances"
echo "===== EC2 Instances =====" >> resourceTracker
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId' >> resourceTracker

# Listing Lambda
echo "Print list of Lambda functions"
echo "===== Lambda Functions =====" >> resourceTracker
aws lambda list-functions >> resourceTracker

# Listing IAM Users
echo "Print list of IAM Users"
echo "===== IAM Users =====" >> resourceTracker
aws iam list-users >> resourceTracker
