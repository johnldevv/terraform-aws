# AWS region (default is Singapore)
variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-southeast-1"
}

# Unique name of the S3 bucket to create
variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

# Environment tag (e.g. dev, prod)
variable "environment" {
  description = "Deployment environment (e.g. dev, prod)"
  type        = string
  default     = "dev"
}
