locals {
  owners = "Platform"
  environment =  var.environment
  name = "${var.project_name}-${local.environment}"

  tags = {
    owners = local.owners
    environment = local.environment
  }

  eks_cluster_name = "${local.name}-${data.terraform_remote_state.eks.outputs.cluster_id}"
}