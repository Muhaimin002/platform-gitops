variable "repository_name" {
  description = "ECR repository name."
  type        = string
}

variable "force_delete" {
  description = "LAB ONLY: allow deleting the repository even if it contains images."
  type        = bool
  default     = true
}

variable "max_tagged_images" {
  description = "Keep this many most recent images; older ones expire."
  type        = number
  default     = 20
}
