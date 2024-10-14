variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-1"
}

variable "github_actions_role_name" {
  description = "The name of the IAM role for GitHub Actions"
  type        = string
  default     = "GithubActionsRole"
}

variable "repo_name" {
  description = "GitHub repository name (format 'owner/repo')"
  type        = string
  default     = "spaceragga/kubernetes-networking-infrastructure"
}

variable "client_id_list" {
  description = "Client ID list for the OIDC provider"
  type        = list(string)
  default     = ["sts.amazonaws.com"]
}

variable "thumbprint_list" {
  description = "Thumbprint list for the OIDC provider"
  type        = list(string)
  default     = ["6938fd4d98bab03faadb97b34396831e3780aea1"]
}

variable "required_iam_policies" {
  description = "Required IAM policies"
  type        = list(string)
  default     = [
    "arn:aws:iam::aws:policy/AmazonEC2FullAccess",
    "arn:aws:iam::aws:policy/AmazonRoute53FullAccess",
    "arn:aws:iam::aws:policy/AmazonS3FullAccess",
    "arn:aws:iam::aws:policy/IAMFullAccess",
    "arn:aws:iam::aws:policy/AmazonVPCFullAccess",
    "arn:aws:iam::aws:policy/AmazonSQSFullAccess",
    "arn:aws:iam::aws:policy/AmazonEventBridgeFullAccess"
  ]
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_1_cidr" {
  description = "CIDR block for the first public subnet"
  default     = "10.0.1.0/24"
}

variable "public_subnet_2_cidr" {
  description = "CIDR block for the second public subnet"
  default     = "10.0.2.0/24"
}

variable "private_subnet_1_cidr" {
  description = "CIDR block for the first private subnet"
  default     = "10.0.3.0/24"
}

variable "private_subnet_2_cidr" {
  description = "CIDR block for the second private subnet"
  default     = "10.0.4.0/24"
}

variable "azs" {
  description = "Availability Zones"
  default     = ["eu-west-1a", "eu-west-1b"]
}

variable "bastion_instance_type" {
  description = "EC2 instance type for the bastion host"
  default     = "t2.micro"
}

variable "bastion_key_name" {
  description = "Name of the SSH key pair"
  type        = string
  default     = "devops-ssh"
}

variable "ami_id" {
  description = "AMI ID"
  default     = "ami-054a53dca63de757b" 
}