#!/bin/bash

set -e  # Exit on any error

echo "🔥 Destroying all Terraform-managed resources for serverless-api..."
terraform destroy -var-file="terraform.tfvars" -auto-approve

# Optional: remove lambda.zip
if [ -f lambda.zip ]; then
  echo "🧹 Cleaning up lambda.zip..."
  rm lambda.zip
fi

echo "✅ Undeploy complete."
