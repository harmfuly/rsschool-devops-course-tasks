terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.18.0"
    }
  }

  backend "s3" {
    bucket         	   = "rss-task-bucket"
    key                = "state/terraform.tfstate"
    region         	   = "eu-north-1"
    encrypt        	   = true
    dynamodb_table = "rss-table"
  }
}

provider "aws" {
  region = "eu-north-1"
}

resource "aws_iam_role" "GithubActionsRole" {
  name               = "GithubActionsRole"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Federated = "arn:aws:iam::585768141216:oidc-provider/token.actions.githubusercontent.com"
        }
        Action = "sts:AssumeRole"
         Condition = {
          StringEquals = {
            "token.actions.githubusercontent.com:sub" = "repo:harmfuly/rsschool-devops-course-tasks:ref:refs/heads/task_1"
          }
      }
      }
    ]
  })
}

resource "aws_iam_policy" "GithubActionsPolicy" {
  name        = "GithubActionsPolicy"
  
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "ec2:*",
          "route53:*",
          "s3:*",
          "iam:*",
          "vpc:*",
          "sqs:*",
          "events:*"
        ]
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "attach_policy" {
  role       = aws_iam_role.GithubActionsRole.name
  policy_arn = aws_iam_policy.GithubActionsPolicy.arn
}