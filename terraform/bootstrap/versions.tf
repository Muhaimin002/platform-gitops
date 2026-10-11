terraform {
  required_version = ">= 1.10.0" # S3 native state locking needs 1.10+

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}
