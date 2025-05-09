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


# Create an HTTP API Gateway
resource "aws_apigatewayv2_api" "http_api" {
  name          = "${var.project_name}-http-api"
  protocol_type = "HTTP"
}

# Link Lambda function as integration target
resource "aws_apigatewayv2_integration" "lambda_integration" {
  api_id                 = aws_apigatewayv2_api.http_api.id
  integration_type       = "AWS_PROXY"
  integration_uri        = aws_lambda_function.api_handler.invoke_arn
  integration_method     = "POST"
  payload_format_version = "2.0"
}

# Define a POST /records route
resource "aws_apigatewayv2_route" "post_record" {
  api_id    = aws_apigatewayv2_api.http_api.id
  route_key = "POST /records"
  target    = "integrations/${aws_apigatewayv2_integration.lambda_integration.id}"
}

# Deploy the API with default stage
resource "aws_apigatewayv2_stage" "default" {
  api_id      = aws_apigatewayv2_api.http_api.id
  name        = "$default"
  auto_deploy = true
}

# Grants API Gateway permission to invoke the Lambda function
resource "aws_lambda_permission" "allow_apigw_invoke" {
  statement_id  = "AllowInvokeFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.api_handler.arn
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_apigatewayv2_api.http_api.execution_arn}/*/*"
}
