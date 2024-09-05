#Input Variables
variable "aws_region" {
  description = "Region for resource creation"
  type = string
  default = "us-east-1"
}

variable "environment" {
  description = "Environment variable : prefix"
  type = string
  default = "dev"
}

variable "project" {
  description = "EKS in TF: project name"
  type = string
  default = "3tier"
}