locals {
  owners = "Platform Team"
  environment =  var.environment
  name = "bastion3Tier"
  cluster_name = "${local.name}-${var.cluster_name}"

  tags = {
    owners = local.owners
    environment = local.environment
  }
}