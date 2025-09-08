resource "aws_eks_cluster" "eks" {
  name     = var.cluster_name
  role_arn = aws_iam_role.eks_cluster_role.arn

  vpc_config {
  # Use private subnets for control plane networking and Fargate scheduling
  subnet_ids         = [for s in aws_subnet.private : s.id]
    endpoint_public_access = true
    endpoint_private_access = false
    public_access_cidrs = ["0.0.0.0/0"]
    security_group_ids  = [aws_security_group.cluster_sg.id]
  }

  depends_on = [aws_iam_role_policy_attachment.eks_cluster_AmazonEKSClusterPolicy]

  tags = {
    Name = var.cluster_name
  }
}

resource "aws_eks_fargate_profile" "fp_default" {
  cluster_name = aws_eks_cluster.eks.name
  fargate_profile_name = "fp-default"
  pod_execution_role_arn = aws_iam_role.fargate_pod_execution_role.arn

  # Fargate requires private subnets (non-public) — use the private subnets
  subnet_ids = [for s in aws_subnet.private : s.id]

  selector {
    namespace = "default"
  }

  tags = { Name = "fp-default" }

  depends_on = [aws_eks_cluster.eks]
}

# resource "aws_eks_identity_provider_config" "oidc_placeholder" {
#   cluster_name = aws_eks_cluster.eks.name
#   # placeholder: not required for basic fargate but kept for future
#   count = 0
#   oidc {
#     client_id                     = "Justaplaceholder"
#     identity_provider_config_name = "Github"
#     issuer_url                    = "oidc.0.githubusercontent.com"
#   }
# }
