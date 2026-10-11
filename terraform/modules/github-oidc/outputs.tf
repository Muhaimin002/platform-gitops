output "oidc_provider_arn" {
  description = "GitHub OIDC identity provider ARN."
  value       = aws_iam_openid_connect_provider.github.arn
}

output "ecr_push_role_arn" {
  description = "Role ARN to put in the GitHub Actions workflow."
  value       = aws_iam_role.ecr_push.arn
}
