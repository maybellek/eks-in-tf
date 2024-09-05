# Terraform Settings Block
terraform {
    required_version = ">= 1.9.3"
    required_providers {
        aws = {
        source  = "hashicorp/aws"
        version = "~> 5.60.0" 
        }
    }

    backend "s3" {
      bucket = "terraform-projects-eksintf"
      key = "dev/eks-cluster/terraform.tfstate"
      region = "us-east-1"
      dynamodb_table = "dev-ekscluster"
    }
}

# Provider Block
provider "aws" {
  profile = "default" 
  region  = var.aws_region
}
