module "vpc" {
  source = "../../modules/vpc"

  name               = var.project
  cluster_name       = var.cluster_name
  enable_nat_gateway = var.enable_nat_gateway
}

module "ecr" {
  source = "../../modules/ecr"

  repository_name = "cloud-native-app"
}

module "github_oidc" {
  source = "../../modules/github-oidc"

  name               = var.project
  github_owner       = var.github_owner
  github_repo        = var.app_repo_name
  ecr_repository_arn = module.ecr.repository_arn
}
