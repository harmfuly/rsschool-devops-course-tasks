variable "region" {
  description = "AWS region"
  default     = "eu-north-1"
}

variable "bucket_name" {
  description = "S3 bucket for Terraform backend"
  default     = "rss-task-bucket"
}

variable "dynamodb_table_name" {
  description = "DynamoDB table for Terraform backend state locking"
  default     = "rss-table"
}

variable "github_oidc_provider_arn" {
  description = "ARN for GitHub OIDC provider"
  default     = "arn:aws:iam::585768141216:oidc-provider/token.actions.githubusercontent.com"
}

variable "github_repo" {
  description = "GitHub repository for OIDC"
  default     = "repo:harmfuly/rsschool-devops-course-tasks:ref:refs/heads/task_1"
}