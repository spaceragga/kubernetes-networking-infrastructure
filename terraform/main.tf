terraform {
  backend "s3" {
    bucket         = "devops-first"
    key            = "terraform/state/terraform.tfstate"
    region         = "eu-west-1"
    encrypt        = true
  }
}

provider "aws" {
  region = var.region
}