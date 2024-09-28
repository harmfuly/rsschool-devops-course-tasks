# Terraform Infrastructure Setup with GitHub Actions

## File Structure

├── main.tf # Main configuration for Terraform
├── .github/
     │ └── workflows/ │ 
              └── terraform-deployment.yml # GitHub Actions workflow for Terraform


## Directory & File Overview

### 1. `main.tf`
The `main.tf` file contains the complete configuration for:
- **Terraform Backend:** Defines the S3 bucket (`rss-task-bucket`) for storing the Terraform state and DynamoDB table (`rss-table`) for state locking.
- **AWS Provider:** Sets up the AWS provider to work in the `eu-north-1` region.
- **IAM Role and Policy:** Creates an `aws_iam_role` (`GithubActionsRole`) with a Trust Policy for GitHub Actions and attaches a policy (`GithubActionsPolicy`) that allows permissions for various AWS services like EC2, S3, IAM, VPC, etc.

### 2. `.github/workflows/terraform-deployment.yml`
The GitHub Actions workflow file (`terraform-deployment.yml`) automates the deployment process. It will be triggered by pull requests or pushes to the default branch and includes three main jobs:
- **terraform-check:** Checks formatting with `terraform fmt`.
- **terraform-plan:** Plans the infrastructure changes with `terraform plan`.
- **terraform-apply:** Deploys changes with `terraform apply`.

## GitHub Secrets

To connect GitHub Actions with AWS, you need to set up the following secrets in your GitHub repository:

- **`AWS_ACCESS_KEY_ID`**: Your AWS Access Key ID
- **`AWS_SECRET_ACCESS_KEY`**: Your AWS Secret Access Key

These secrets enable the workflow to assume the IAM role (`GithubActionsRole`) and deploy the infrastructure.

## How to Use

1. **Install Required Software:**
   - [Terraform CLI](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
   - [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)

2. **Configure AWS Account:**
   - Set up your AWS credentials and configure MFA for enhanced security.
   - Ensure the S3 bucket and DynamoDB table for state management exist (`rss-task-bucket` and `rss-table`).

3. **Deploy the Infrastructure:**
   - Push your code to the GitHub repository.
   - The GitHub Actions workflow (`terraform.yml`) will automatically run:
     - **Format Check:** Ensures Terraform code is formatted correctly.
     - **Plan:** Previews the changes.
     - **Apply:** Deploys the infrastructure if the plan is correct.

4. **Verify:**
   - Check that the Terraform state is stored in your S3 bucket.
   - Validate that the `GithubActionsRole` is created with the correct policies.

This README provides the basic steps and structure for setting up and using your Terraform infrastructure with GitHub Actions.
