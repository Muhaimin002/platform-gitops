variable "aws_region" {
  description = "AWS region for the state bucket."
  type        = string
  default     = "ap-south-1"
}

variable "project" {
  description = "Short project name used in resource names (lowercase letters, numbers, hyphens)."
  type        = string
  default     = "portfolio"

  validation {
    condition     = can(regex("^[a-z0-9-]{3,20}$", var.project))
    error_message = "project must be 3-20 characters: lowercase letters, numbers, hyphens."
  }
}

variable "force_destroy" {
  description = "LAB ONLY: allow Terraform to delete the bucket even if it holds state files. Set false for real use."
  type        = bool
  default     = true
}
