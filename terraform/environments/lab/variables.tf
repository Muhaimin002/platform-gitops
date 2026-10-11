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

variable "kubernetes_version" {
  description = "EKS Kubernetes version."
  type        = string
  default     = "1.36"
}

variable "public_access_cidrs" {
  description = "Your public IP as x.x.x.x/32. Allowed to reach the Kubernetes API."
  type        = list(string)
}

variable "node_instance_types" {
  description = "Worker node instance types."
  type        = list(string)
  default     = ["t3.medium"]
}

variable "node_desired_size" {
  type    = number
  default = 2
}

variable "node_min_size" {
  type    = number
  default = 1
}

variable "node_max_size" {
  type    = number
  default = 3
}

variable "cluster_log_types" {
  description = "Control plane log types. Use [] to disable and save cost."
  type        = list(string)
  default     = ["api", "audit", "authenticator"]
}
