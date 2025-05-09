#!/bin/bash

set -e  # Exit on any error

echo "📦 Zipping Lambda handler..."
cd lambda
zip ../lambda.zip handler.js > /dev/null
cd ..

echo "🚀 Running Terraform init..."
terraform init -upgrade

echo "✅ Applying Terraform..."
terraform apply -var-file="terraform.tfvars" -auto-approve

echo "🎉 Deployment complete!"
