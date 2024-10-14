provider "aws" {
  alias  = "secondary"
  region = "us-east-1"
}

resource "aws_iam_role" "GithubActionsRole" {
  name = "GithubActionsRole-${var.environment}"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Federated = "token.actions.githubusercontent.com"
        }
        Action = "sts:AssumeRoleWithWebIdentity"
        Condition = {
          StringEquals = {
            "token.actions.githubusercontent.com:sub" = "repo:${var.github_repo}"
          }
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "attach_eventbridge_policy" {
  role       = aws_iam_role.GithubActionsRole.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEventBridgeFullAccess"
}
