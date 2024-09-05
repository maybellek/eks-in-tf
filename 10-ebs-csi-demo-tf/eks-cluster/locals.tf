locals {
  owners = "Platform"
  environment =  var.environment
  name = "${var.project_name}-${local.environment}"

  tags = {
    owners = local.owners
    environment = local.environment
  }
}