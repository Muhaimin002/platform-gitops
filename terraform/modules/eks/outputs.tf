output "cluster_name" {
  description = "EKS cluster name."
  value       = aws_eks_cluster.this.name
}

output "cluster_endpoint" {
  description = "Kubernetes API endpoint."
  value       = aws_eks_cluster.this.endpoint
}

output "cluster_security_group_id" {
  description = "Security group EKS created for the cluster and managed nodes."
  value       = aws_eks_cluster.this.vpc_config[0].cluster_security_group_id
}

output "oidc_provider_arn" {
  description = "OIDC provider ARN for IAM roles for service accounts."
  value       = aws_iam_openid_connect_provider.cluster.arn
}

output "oidc_issuer" {
  description = "OIDC issuer URL (without https://) for trust policies."
  value       = replace(aws_eks_cluster.this.identity[0].oidc[0].issuer, "https://", "")
}

output "node_role_arn" {
  description = "IAM role ARN used by the worker nodes."
  value       = aws_iam_role.node.arn
}
