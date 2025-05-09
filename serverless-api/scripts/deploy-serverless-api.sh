#!/bin/bash

set -e  # Exit on error

echo "📦 Installing Lambda dependencies..."
cd lambda
npm install @aws-sdk/client-dynamodb uuid > /dev/null

echo "📦 Zipping Lambda code with dependencies..."
zip -r ../lambda.zip . > /dev/null
cd ..

echo "🚀 Running Terraform init..."
terraform init -upgrade

echo "✅ Applying Terraform..."
terraform apply -var-file="terraform.tfvars" -auto-approve

echo "🎉 Deployment complete!"
