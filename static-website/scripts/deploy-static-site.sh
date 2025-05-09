#!/bin/bash

# Automatically get bucket name from Terraform output
BUCKET_NAME=$(terraform output -raw bucket_name)

echo "Uploading index.html and error.html to bucket: $BUCKET_NAME"

aws s3 cp "$(dirname "$0")/html/index.html" s3://$BUCKET_NAME/index.html
aws s3 cp "$(dirname "$0")/html/error.html" s3://$BUCKET_NAME/error.html
