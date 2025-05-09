
### 🔹 static-website/README.md

# Static Website Stack (S3 + HTML Upload)

This Terraform stack provisions an AWS S3 bucket configured for static website hosting, including a deploy script to upload HTML files.

---

## 🚀 Features

* ✅ S3 bucket with static website hosting enabled
* ✅ Sample `index.html` and `error.html`
* ✅ Bash script to automate file upload

---

## 📁 Folder Structure

```
static-website/
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars.example
├── scripts/
│   ├── deploy-static-site.sh
│   └── html/
│       ├── index.html
│       └── error.html

```

---

## 🧪 Usage

### 1. Copy `terraform.tfvars.example`

```bash
cp terraform.tfvars.example terraform.tfvars
```

Then update the values

```hcl
bucket_name = "your-unique-bucket-name"
region      = "ap-southeast-1"
environment = "dev"
```

### 2. Deploy with Terraform

```bash
terraform init
terraform apply -var-file="terraform.tfvars" -auto-approve
```

### 3. Upload Site Files

```bash
./scripts/deploy-static-site.sh
```

This will copy `index.html` and `error.html` to the bucket.

---

## 🔗 Output

You’ll get a public website URL like:

```
http://<your-bucket-name>.s3-website-<region>.amazonaws.com
```

You can also view it using:

```bash
terraform output website_endpoint
```