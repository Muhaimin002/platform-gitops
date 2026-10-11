terraform {
  backend "s3" {
    bucket       = "portfolio-tfstate-988710971470-ap-south-1"
    key          = "lab/terraform.tfstate"
    region       = "ap-south-1"
    encrypt      = true
    use_lockfile = true
  }
}
