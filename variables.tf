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
  default     = ["eu-north-1a", "eu-north-1b", "eu-north-1c"]
}

variable "github_repo" {
  description = "GitHub repository for which the OIDC token will be used"
  type        = string
}
