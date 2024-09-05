#Input Variables

variable "aws_region" {
  description = "Region for resource creation"
  type = string
  default = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type = string
  default = "t3.micro"
}

variable "instance_keypair" {
  description = "AWS EC2 keypair for instance access"
  type = string
  default = "terraform-key"
}

variable "instance_type_list" {
  description = "EC2 Instance type List"
  type = list(string)
  default = [ "t2.micro", "t3.micro" ]
}

variable "instance_type_map" {
  description = "EC2 instance type map"
  type = map(string)
  default = {
    "dev" = "t2.micro"
    "test" = "t3.micro"
    "prod" = "t3.small" 
  }
}