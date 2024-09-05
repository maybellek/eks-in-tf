data "terraform_remote_state" "eks" {
  backend = "s3"
  config = {
    bucket = "terraform-projects-eksintf"
    key    = "dev/eks-cluster/terraform.tfstate"
    region = var.aws_region
  }
}