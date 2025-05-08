# Specify AWS provider and region
provider "aws" {
  region = var.region
}

# Issues
# - Error creating S3 Bucket
#   BucketAlreadyExists
# - Solution
#   Use a unique S3 bucket name
#
# - Error: putting S3 Bucket
#   api error AccessDenied: User: [User ARN] is not authorized to perform: s3:PutBucketPolicy on resource: [S3 Resource ARN] because public policies are blocked by the BlockPublicPolicy block public access setting
# - Solution
#   Add `depends_on = [aws_s3_bucket_public_access_block.website]` inside `aws_s3_bucket_policy` resource
#   Add `aws_s3_bucket_public_access_block` resource

# Create the S3 bucket
resource "aws_s3_bucket" "website" {
  bucket = var.bucket_name  # Bucket name must be globally unique

  tags = {
    Name        = "StaticWebsite"
    Environment = var.environment
  }
}

resource "aws_s3_bucket_public_access_block" "website" {
  bucket = aws_s3_bucket.website.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# Enable static website hosting on the S3 bucket
resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.website.id

  index_document {
    suffix = "index.html"   # Default file to load at root
  }

  error_document {
    key = "error.html"     # File to show when user hits a missing page (404)
  }
}

# (Optional) Make all files in the bucket publicly readable
resource "aws_s3_bucket_policy" "public_read" {
  bucket = aws_s3_bucket.website.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",                            # Allow access
        Principal = "*",                             # From any user
        Action = ["s3:GetObject"],                   # To read objects
        Resource = "${aws_s3_bucket.website.arn}/*"  # All objects in the bucket
      }
    ]
  })

  depends_on = [aws_s3_bucket_public_access_block.website]
}
