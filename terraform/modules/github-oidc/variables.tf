variable "name" {
  description = "Name prefix for IAM resources."
  type        = string
}

variable "github_owner" {
  description = "GitHub user or organization that owns the repository."
  type        = string
}

variable "github_repo" {
  description = "Repository allowed to push images (without the owner)."
  type        = string
}

variable "github_branch" {
  description = "Only workflows running on this branch may assume the role."
  type        = string
  default     = "main"
}

variable "ecr_repository_arn" {
  description = "ARN of the ECR repository the role may push to."
  type        = string
}
