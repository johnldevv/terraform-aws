### 🔹 serverless-api/README.md

# Serverless API Stack (Lambda + API Gateway + DynamoDB)

This Terraform stack provisions a simple serverless API using AWS Lambda, API Gateway (HTTP API), and DynamoDB. It includes deploy/undeploy scripts and sample Node.js 22 handler code with DynamoDB integration.

---

## 🚀 Features

* ✅ Node.js 22 Lambda handler
* ✅ POST route via API Gateway
* ✅ DynamoDB table for storage
* ✅ Bash scripts for deploy & undeploy

---

## 📁 Folder Structure

```
serverless-api/
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars.example
├── lambda/
│   ├── handler.js
├── scripts/
│   ├── deploy-serverless-api.sh
│   └── undeploy-serverless-api.sh
```

---

## 🧪 Usage

### 1. Copy `terraform.tfvars.example`

```bash
cp terraform.tfvars.example terraform.tfvars
```

Then update the values:

```hcl
project_name = "serverless-api"
region       = "ap-southeast-1"
environment  = "dev"
```

### 2. Deploy with Terraform

```bash
./scripts/deploy-serverless-api.sh
```

This installs dependencies, zips the Lambda, and applies Terraform.

### 3. Test the API

```bash
curl -X POST $(terraform output -raw api_base_url)/records \
  -H "Content-Type: application/json" \
  -d '{"type":"feedback","data":{"user":"john","comment":"great!"}}'
```

---

## 🔗 Output

You’ll get a base URL like:

```
https://<api-id>.execute-api.<region>.amazonaws.com/staging
```

You can confirm with:

```bash
terraform output api_base_url
```