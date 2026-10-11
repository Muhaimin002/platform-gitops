variable "cluster_name" {
  description = "EKS cluster name."
  type        = string
}

variable "kubernetes_version" {
  description = "Kubernetes version (must be a version EKS currently supports)."
  type        = string
  default     = "1.36"

  validation {
    condition     = can(regex("^1\\.[0-9]{2}$", var.kubernetes_version))
    error_message = "kubernetes_version must look like 1.36."
  }
}

variable "private_subnet_ids" {
  description = "Private subnets for worker nodes."
  type        = list(string)
}

variable "public_subnet_ids" {
  description = "Public subnets (load balancer placement)."
  type        = list(string)
}

variable "endpoint_public_access" {
  description = "Expose the Kubernetes API publicly, limited to public_access_cidrs."
  type        = bool
  default     = true
}

variable "public_access_cidrs" {
  description = "CIDRs allowed to reach the public API endpoint. Never 0.0.0.0/0."
  type        = list(string)
  default     = []

  validation {
    condition     = alltrue([for c in var.public_access_cidrs : can(cidrhost(c, 0))])
    error_message = "Every entry must be a valid CIDR such as 203.0.113.10/32."
  }

  validation {
    condition     = !contains(var.public_access_cidrs, "0.0.0.0/0")
    error_message = "0.0.0.0/0 is not allowed for the Kubernetes API endpoint."
  }
}

variable "enabled_cluster_log_types" {
  description = "Control plane log types to send to CloudWatch. Empty list disables logging."
  type        = list(string)
  default     = ["api", "audit", "authenticator"]

  validation {
    condition = alltrue([
      for t in var.enabled_cluster_log_types :
      contains(["api", "audit", "authenticator", "controllerManager", "scheduler"], t)
    ])
    error_message = "Allowed: api, audit, authenticator, controllerManager, scheduler."
  }
}

variable "log_retention_days" {
  description = "CloudWatch retention for control plane logs."
  type        = number
  default     = 7
}

variable "enable_secrets_encryption" {
  description = "Encrypt Kubernetes Secrets in etcd with a customer-managed KMS key."
  type        = bool
  default     = true
}

variable "admin_principal_arns" {
  description = "Extra IAM principals (users/roles) given cluster-admin. The cluster creator is added automatically."
  type        = list(string)
  default     = []
}

variable "node_instance_types" {
  description = "Worker node instance types."
  type        = list(string)
  default     = ["t3.medium"]
}

variable "node_ami_type" {
  description = "Node AMI type. Must match the CPU architecture of node_instance_types."
  type        = string
  default     = "AL2023_x86_64_STANDARD"
}

variable "node_capacity_type" {
  description = "ON_DEMAND or SPOT."
  type        = string
  default     = "ON_DEMAND"

  validation {
    condition     = contains(["ON_DEMAND", "SPOT"], var.node_capacity_type)
    error_message = "node_capacity_type must be ON_DEMAND or SPOT."
  }
}

variable "node_desired_size" {
  description = "Desired number of worker nodes."
  type        = number
  default     = 2
}

variable "node_min_size" {
  description = "Minimum number of worker nodes."
  type        = number
  default     = 1
}

variable "node_max_size" {
  description = "Maximum number of worker nodes."
  type        = number
  default     = 3
}

variable "node_disk_size" {
  description = "Node root volume size in GiB."
  type        = number
  default     = 20
}
