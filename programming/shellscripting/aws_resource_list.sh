#!/bin/bash

# This script  will list all the resources in the AWS account
# Author : Suchithra
# Version : v0.0.1
# 
# Following are the supported AWS services by thhe script
# 1.EC2
# 2.RDS
# 3.S3
#
# Usage : ./aws_resource_list.sh <region> <service_name>
# Example :./aws_resource_list.sh us-east-1 EC2
#
# Note : The script requires  AWS CLI  to be installed and configured with the necessary permissions
####################################################################################################

if [ $# -ne 2 ]; then
    echo "Usage: $0 <aws_region> <aws_service>"
    echo "Example: $0 us-east-1 ec2"
    exit 1
fi

aws_region=$1
aws_service=$(echo "$2" | tr '[:upper:]' '[:lower:]')

if ! command -v aws &> /dev/null; then
    echo "AWS CLI is not installed. Please install it first."
    exit 1
fi

if [ ! -d ~/.aws ]; then
    echo "AWS CLI not configured. Run 'aws configure' and try again."
    exit 1
fi

case $aws_service in
    ec2)
        echo "Listing EC2 Instances in $aws_region"
        aws ec2 describe-instances --region $aws_region
        ;;
    rds)
        echo "Listing RDS Instances in $aws_region"
        aws rds describe-db-instances --region $aws_region
        ;;
    s3)
        echo "Listing S3 Buckets in $aws_region"
        aws s3api list-buckets --region $aws_region
        ;;
    *)
        echo "Invalid service: $aws_service"
        echo "Supported services: ec2, rds, s3"
        exit 1
        ;;
esac
