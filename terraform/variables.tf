variable "region" {
  description = "The AWS region"
  type        = string
  default     = "eu-west-1"
}

variable "github_actions_role_name" {
  description = "The name of the IAM role for GitHub Actions"
  type        = string
  default     = "GithubActionsRole"
}

variable "repo_name" {
  description = "The GitHub repository name in the format 'owner/repo'"
  type        = string
  default     = "spaceragga/kubernetes-networking-infrastructure"
}

variable "client_id_list" {
  description = "The client ID list for the OIDC provider"
  type        = list(string)
  default     = ["sts.amazonaws.com"]
}

variable "thumbprint_list" {
  description = "The thumbprint list for the OIDC provider"
  type        = list(string)
  default     = ["6938fd4d98bab03faadb97b34396831e3780aea1"]
}

variable "required_iam_policies" {
  description = "Required IAM Policies"
  type        = list(string)
  default = [
    "arn:aws:iam::aws:policy/AmazonEC2FullAccess",
    "arn:aws:iam::aws:policy/AmazonRoute53FullAccess",
    "arn:aws:iam::aws:policy/AmazonS3FullAccess",
    "arn:aws:iam::aws:policy/IAMFullAccess",
    "arn:aws:iam::aws:policy/AmazonVPCFullAccess",
    "arn:aws:iam::aws:policy/AmazonSQSFullAccess",
    "arn:aws:iam::aws:policy/AmazonEventBridgeFullAccess"
  ]
}