#Bastion EC2 Security Group: Module
module "public_bastion_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.2"

  name = "${local.name}-ec2-sg"
  description = "Security group rule for SSH inbound access and all outboud access"
  vpc_id = module.vpc.vpc_id

  ingress_rules = ["ssh-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]

  egress_rules = ["all-all"]
  tags = local.tags
}

#Bastion EC2 Instance
module "bastion_public" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.6.1"

  name = "${local.name}_server"
  ami = data.aws_ami.amzlinux2.id

  instance_type          = var.instance_type
  key_name               = var.instance_keypair
  monitoring             = true
  vpc_security_group_ids = [ module.public_bastion_sg.security_group_id ]
  subnet_id              = module.vpc.public_subnets[0]

  tags = local.tags
}

#Elastic IP for ther bastion
resource "aws_eip" "bastion_eip" {
    depends_on = [ module.bastion_public, module.vpc ]
    instance = module.bastion_public.id
    domain   = "vpc"
    tags = local.tags
}

