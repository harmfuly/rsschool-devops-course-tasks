provider "aws" {
  region = var.region
}

# Создание GitHub OIDC провайдера
resource "aws_iam_openid_connect_provider" "github_oidc" {
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = ["<thumbprint_value>"]  # Нужно указать правильный thumbprint
  url             = "https://token.actions.githubusercontent.com"
}

resource "aws_iam_role" "GithubActionsRole" {
  name = "GithubActionsRole"
  
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Federated = aws_iam_openid_connect_provider.github_oidc.arn
        }
        Action = "sts:AssumeRoleWithWebIdentity"
        Condition = {
          StringEquals = {
            "token.actions.githubusercontent.com:sub" = var.github_repo
          }
        }
      }
    ]
  })
}

# Использование Amazon Managed Policy для полного доступа к EventBridge
resource "aws_iam_role_policy_attachment" "attach_eventbridge_policy" {
  role       = aws_iam_role.GithubActionsRole.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEventBridgeFullAccess"
}
