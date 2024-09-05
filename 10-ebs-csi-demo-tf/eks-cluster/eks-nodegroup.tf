resource "aws_eks_node_group" "demo_eks_nodegroup_public" {
  cluster_name    = aws_eks_cluster.demo_eks_cluster.name
  node_group_name = "${local.name}-demoeks-ng-public"
  node_role_arn   = aws_iam_role.eks_nodegroup_role.arn
  subnet_ids      = module.vpc.public_subnets
  
  ami_type = "AL2_x86_64"
  capacity_type = "ON_DEMAND"
  disk_size = 20
  instance_types = ["t3.medium"]
  remote_access {
    ec2_ssh_key = "terraform-key"
  }

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }
  
  depends_on = [
    aws_iam_role_policy_attachment.eks-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.eks-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.eks-AmazonEC2ContainerRegistryReadOnly,
  ]

  tags = {
    Name = "Public-Node-Group"
  }
}

# resource "aws_eks_node_group" "demo_eks_nodegroup_private" {
#   cluster_name    = aws_eks_cluster.demo_eks_cluster.name
#   node_group_name = "${local.name}-demoeks-ng-private"
#   node_role_arn   = aws_iam_role.eks_nodegroup_role.arn
#   subnet_ids      = module.vpc.private_subnets
  
#   ami_type = "AL2_x86_64"
#   capacity_type = "ON_DEMAND"
#   disk_size = 20
#   instance_types = ["t3.micro"]
#   remote_access {
#     ec2_ssh_key = "terraform-key"
#   }

#   scaling_config {
#     desired_size = 1
#     max_size     = 2
#     min_size     = 1
#   }

#   update_config {
#     max_unavailable = 1
#   }
  
#   depends_on = [
#     aws_iam_role_policy_attachment.eks-AmazonEKSWorkerNodePolicy,
#     aws_iam_role_policy_attachment.eks-AmazonEKS_CNI_Policy,
#     aws_iam_role_policy_attachment.eks-AmazonEC2ContainerRegistryReadOnly,
#   ]

#   tags = {
#     Name = "Private-Node-Group"
#   }
# }