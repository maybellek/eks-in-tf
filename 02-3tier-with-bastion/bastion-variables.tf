variable "instance_type" {
  description = "Bastion EC2 instance type"
  type = string
  default = "t3.micro"
}

variable "instance_keypair" {
  description = "EC2 ssh connection key file"
  type = string
  default = "terraform-key"
}