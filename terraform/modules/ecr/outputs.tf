output "repository_url" {
  description = "ECR repository URL (without a tag)."
  value       = aws_ecr_repository.this.repository_url
}

output "repository_arn" {
  description = "ECR repository ARN (used for IAM policies)."
  value       = aws_ecr_repository.this.arn
}
