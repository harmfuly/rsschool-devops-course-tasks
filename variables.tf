variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "172.31.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets"
  default     = ["172.31.0.0/24", "172.31.1.0/24"]
}

variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for private subnets"
  default     = ["172.31.0.0/24", "172.31.1.0/24"]
}

variable "azs" {
  description = "List of availability zones to use"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "github_repo" {
  description = "GitHub repository in the format 'owner/repo'"
  type        = string
  default     = "harmfuly/rsschool-devops-course-tasks"
}

variable "environment" {
  description = "The environment for the resources (e.g., dev, staging, prod)"
  type        = string
  default     = "dev"
}
