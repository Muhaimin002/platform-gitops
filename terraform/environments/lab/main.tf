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

module "eks" {
  source = "../../modules/eks"

  cluster_name              = var.cluster_name
  kubernetes_version        = var.kubernetes_version
  private_subnet_ids        = module.vpc.private_subnet_ids
  public_subnet_ids         = module.vpc.public_subnet_ids
  public_access_cidrs       = var.public_access_cidrs
  enabled_cluster_log_types = var.cluster_log_types
  node_instance_types       = var.node_instance_types
  node_desired_size         = var.node_desired_size
  node_min_size             = var.node_min_size
  node_max_size             = var.node_max_size
}
