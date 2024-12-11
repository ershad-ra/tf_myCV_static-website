# Define the AWS provider and region
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.3.0"
  backend "s3" {
    bucket = "mycv-backend"
    key = "state/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1" # The AWS region where resources will be created
}