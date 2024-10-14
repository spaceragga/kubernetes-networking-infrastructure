# Infrastructure Setup and Usage

This README provides information on setting up and using the infrastructure defined in this repository using Terraform.

## Prerequisites

Before you can use the infrastructure, ensure you have the following installed:

- [Terraform](https://www.terraform.io/downloads.html) (v1.0+)
- [AWS CLI](https://aws.amazon.com/cli/) (v2.0+)
- AWS Account with appropriate permissions
  - Permissions to create VPCs, subnets, IAM roles, etc.
- GitHub access for using GitHub Actions if required.

## Overview

This Terraform configuration sets up an AWS Virtual Private Cloud (VPC) with:

- **2 Public Subnets** in different Availability Zones (AZs)
- **2 Private Subnets** in different Availability Zones
- **Internet Gateway** (IGW) for public subnet access
- **NAT Gateway** for enabling outbound access for private subnets
- **Route tables** for both public and private subnets
- **IAM roles and policies** for GitHub Actions and specific users

### Resources Created

- **VPC**: A main VPC with customizable CIDR blocks
- **Subnets**: Public and Private subnets in different AZs
- **Internet Gateway**: For public internet access
- **NAT Gateway**: For private subnet instances to access the internet
- **Route Tables**: Separate route tables for public and private subnets
- **IAM Roles**: For GitHub Actions and specific IAM users

## Setup Steps

### Step 1: Clone the Repository

To get started, clone the repository to your local machine:

```
git clone <repository-url>
cd <repository-directory>
```

### Step 2: Configure AWS CLI


Make sure your AWS credentials are properly configured:
```
aws configure
```


### Step 3: Initialize Terraform
```
terraform init
```

### Step 4: Review and Update Variables
Review and update the variables.tf file with your own values if necessary:

- region: The AWS region for resource creation (default: eu-west-1).
- CIDR blocks for VPC, subnets, etc.
- IAM role names and GitHub repository details.
Alternatively, you can override these values at runtime using a terraform.tfvars file or through the command line.

### Step 5: Plan and Apply the Infrastructure
**Dry Run (Plan)**
Review the plan before applying the changes:
```
terraform plan
```
**Apply**
Once you're satisfied with the plan, apply the changes:
```
terraform apply
```

### Step 6: Outputs
After the infrastructure is successfully created, Terraform will output the following:

  - VPC ID
  - Public Subnet IDs
  - Private Subnet IDs

These outputs can be referenced for any future configurations or integrations.

### Step 7: Accessing Subnets and Resources
  - Instances in public subnets can reach the internet via the Internet Gateway.
  - Instances in private subnets can reach the internet via the NAT Gateway.
### Step 8: Modify the Configuration
To make changes to the infrastructure (e.g., update CIDR blocks, add/remove subnets), modify the appropriate Terraform files and reapply:
```
terraform plan
terraform apply
```

### Step 9: Destroying the Infrastructure
If you need to tear down the infrastructure, run:
```
terraform destroy
```