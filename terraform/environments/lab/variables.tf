variable "aws_region" {
  description = "AWS region for the lab."
  type        = string
  default     = "ap-south-1"
}

variable "project" {
  description = "Short project name."
  type        = string
  default     = "portfolio"
}

variable "cluster_name" {
  description = "EKS cluster name (used for subnet tags now, the cluster itself in Phase 3)."
  type        = string
  default     = "portfolio-lab"
}

variable "enable_nat_gateway" {
  description = "Create the single lab NAT Gateway. Turn on in Phase 3. Billed hourly."
  type        = bool
  default     = false
}

variable "github_owner" {
  description = "GitHub account that owns the application repository."
  type        = string
  default     = "Muhaimin002"
}

variable "app_repo_name" {
  description = "Application repository allowed to push images to ECR."
  type        = string
  default     = "cloud-native-app"
}
