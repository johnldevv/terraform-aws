provider "aws" {
  region = var.region
}

# IAM role for Lambda to assume at runtime
resource "aws_iam_role" "lambda_exec" {
  name = "${var.project_name}-lambda-exec"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"  # Only Lambda can assume this role
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# Attach AWS-managed policy for basic CloudWatch logging
resource "aws_iam_role_policy_attachment" "lambda_logs" {
  role       = aws_iam_role.lambda_exec.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

# Lambda function resource using Node.js 22 runtime
resource "aws_lambda_function" "api_handler" {
  function_name = "${var.project_name}-handler"
  role          = aws_iam_role.lambda_exec.arn

  runtime = "nodejs22.x"
  handler = "handler.handler"  # maps to lambda/handler.js → export const handler

  filename         = "${path.module}/lambda.zip"
  source_code_hash = filebase64sha256("${path.module}/lambda.zip")

  tags = {
    Environment = var.environment
  }
}
