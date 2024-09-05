data "aws_partition" "current" {}

resource "aws_iam_openid_connect_provider" "oidc_provider" {
  url = aws_eks_cluster.demo_eks_cluster.identity[0].oidc[0].issuer

  client_id_list  = ["sts.${data.aws_partition.current.dns_suffix}"]

  thumbprint_list = [var.eks_oidc_root_ca_thumbprint]

  tags = merge(
    {
        Name = "${var.cluster_name}-eks-irsa"
    },
    local.tags
  )
}

# Output: AWS IAM Open ID Connect Provider ARN
output "aws_iam_openid_connect_provider_arn" {
  description = "AWS IAM Open ID Connect Provider ARN"
  value = aws_iam_openid_connect_provider.oidc_provider.arn 
}

# Extract OIDC Provider from OIDC Provider ARN
locals {
    aws_iam_oidc_connect_provider_extract_from_arn = element(split("oidc-provider/", "${aws_iam_openid_connect_provider.oidc_provider.arn}"), 1)
}

# Output: AWS IAM Open ID Connect Provider
output "aws_iam_openid_connect_provider_extract_from_arn" {
  description = "AWS IAM Open ID Connect Provider extract from ARN"
   value = local.aws_iam_oidc_connect_provider_extract_from_arn
}