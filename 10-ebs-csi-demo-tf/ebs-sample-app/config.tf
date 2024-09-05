# Terraform Settings Block
terraform {
    required_version = ">= 1.9.3"
    required_providers {
        aws = {
          source  = "hashicorp/aws"
          version = "~> 5.60.0" 
        }
        helm = {
          source = "hashicorp/helm"
          version = "~> 2.15"
          #version = "2.15.0"
        }
         http = {
          source = "hashicorp/http"
          version = "3.4.4"
        }
    }

    backend "s3" {
      bucket = "terraform-projects-eksintf"
      key = "dev/ebs-sample-app/terraform.tfstate"
      region = "us-east-1"
      dynamodb_table = "dev-ebs-sample-app"
    }
}

# Provider Blocks
#AWS
provider "aws" {
  profile = "default" 
  region  = var.aws_region
}

#HTTP
provider "http" {
  # Configuration options
}