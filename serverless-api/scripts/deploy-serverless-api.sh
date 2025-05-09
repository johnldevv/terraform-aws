#!/bin/bash

set -e  # Exit on any error

echo "📦 Zipping Lambda handler..."
zip lambda.zip lambda/handler.js > /dev/null

echo "🚀 Running Terraform init..."
terraform init -upgrade

echo "✅ Applying Terraform..."
terraform apply -var-file="terraform.tfvars" -auto-approve

echo "🎉 Deployment complete!"
