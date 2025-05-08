## 📁 terraform-aws/ — Stacks

> 🟢 **Basic** = core services covered in SAA exam
> 🟡 **Optional** = commonly used real-world add-ons

### 🔹 static-website/

**🟢 Basic:**

* S3 (static site, encryption, versioning)
* CloudFront (with OAC or signed URLs)
* Route 53 (domain, A record)

**🟡 Optional:**

* ACM (SSL cert for custom domain)
* WAF (optional protection)
* S3 access logs to logging bucket
* CloudWatch (CDN metrics, alarms)

---

### 🔹 serverless-api/

**🟢 Basic:**

* Lambda (Node.js/Python)
* API Gateway (HTTP API with CORS)
* DynamoDB (auto scaling, TTL)
* Cognito (User Pool, App Client, Hosted UI)

**🟡 Optional:**

* SSM Parameter Store (secrets)
* CloudWatch Logs + Metrics
* X-Ray tracing
* EventBridge (scheduled jobs, event rules)
* S3 (uploads or output)
* WAF (protect API)

---

### 🔹 ec2-rds-app/

**🟢 Basic:**

* EC2 (Launch Template + User Data)
* RDS (MySQL/PostgreSQL, Multi-AZ, snapshots)
* VPC + public/private subnets + NAT + IGW
* ALB + Security Groups

**🟡 Optional:**

* EFS (optional shared storage)
* SSM Agent + Session Manager (no SSH)
* CloudWatch Agent (OS metrics)
* Auto Scaling Group
* IAM roles (least privilege)
* KMS (encryption)

---

### 🔹 wordpress-ha/

**🟢 Basic:**

* EC2 (auto scaling, ALB)
* RDS (MySQL with Multi-AZ)
* EFS (media shared across nodes)

**🟡 Optional:**

* S3 (backups)
* Route 53
* ACM + WAF
* CloudWatch (alarms, logs)

---

### 🔹 vpc-basic/

**🟢 Basic:**

* VPC + CIDR block
* Public/private subnets
* Route tables + IGW/NAT

**🟡 Optional:**

* DHCP options
* NACLs + Security Groups
* Flow logs to CloudWatch or S3

---

### 🔹 load-balancer/

**🟢 Basic:**

* ALB or NLB
* Target groups + listener rules

**🟡 Optional:**

* Logging to S3
* WAF (attach to ALB)
* ACM (cert for HTTPS)

---

### 🔹 private-link-endpoint/

**🟢 Basic:**

* Interface VPC Endpoint

**🟡 Optional:**

* Security Groups + routing
* Endpoint policies
* Route 53 private DNS zone

---

### 🔹 cloudfront-oac/

**🟢 Basic:**

* CloudFront with OAC (secure S3)

**🟡 Optional:**

* Origin failover config (multi-region)
* Logging + metrics
* WAF + geo/block rules

---

### 🔹 data-pipeline/

**🟢 Basic:**

* Kinesis Data Stream or Firehose
* S3 (landing and final buckets)
* Glue job + crawler

**🟡 Optional:**

* Lambda (transforms)
* Athena (query S3)
* IAM policies for least privilege
* Step Functions (orchestrate ETL)
* CloudWatch (error tracking)

---

### 🔹 athena-query-logs/

**🟢 Basic:**

* CloudTrail or ELB logs to S3
* Glue Crawler
* Athena table + saved queries
* IAM roles

---

### 🔹 opensearch-stack/

**🟢 Basic:**

* OpenSearch domain
* VPC access + SG rules

**🟡 Optional:**

* Cognito or fine-grained auth
* Index template + dashboard
* CloudWatch monitoring

---

### 🔹 redshift-lab/

**🟢 Basic:**

* Redshift cluster

**🟡 Optional:**

* Enhanced VPC routing
* IAM roles + S3 access
* CloudWatch alarms

---

### 🔹 cloudwatch-alarms/

**🟢 Basic:**

* Alarms for EC2, RDS, Lambda
* SNS notifications

**🟡 Optional:**

* Composite alarms
* Dashboards

---

### 🔹 log-centralization/

**🟢 Basic:**

* CloudWatch Logs
* Export to S3

**🟡 Optional:**

* Subscription filter to Lambda or Kinesis
* S3 lifecycle rules

---

### 🔹 billing-alert/

**🟢 Basic:**

* AWS Budgets
* SNS topic
* Email alert

---

### 🔹 cloudtrail-logs/

**🟢 Basic:**

* CloudTrail trail (across regions)
* Log to encrypted S3

**🟡 Optional:**

* Event selector filtering

---

### 🔹 sns-lambda/

**🟢 Basic:**

* SNS topic
* Lambda trigger
* IAM role + policy

---

### 🔹 sqs-dlq-lambda/

**🟢 Basic:**

* SQS queue + DLQ
* Lambda triggered by queue
* CloudWatch error handling

---

### 🔹 eventbridge-scheduler/

**🟢 Basic:**

* EventBridge schedule rule
* Target: Lambda or Step Functions
* IAM permissions

---

### 🔹 step-functions-lambda/

**🟢 Basic:**

* Step Functions
* Lambda tasks

**🟡 Optional:**

* Retry/backoff logic
* IAM role for state machine

---

### 🔹 ssm-automation/

**🟢 Basic:**

* SSM RunCommand
* IAM roles

**🟡 Optional:**

* SSM Patch Manager
* Tag-based targeting

---

### 🔹 parameter-store-secrets/

**🟢 Basic:**

* SSM Parameter Store
* Secrets Manager
* KMS encryption

**🟡 Optional:**

* Reference in Lambda, ECS, etc.

---

### 🔹 github-actions-oidc/

**🟢 Basic:**

* IAM Role for GitHub OIDC
* Trust policy for GitHub

**🟡 Optional:**

* Deploy S3, Lambda, or ECS via Actions
