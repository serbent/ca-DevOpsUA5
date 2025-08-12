terraform {
  backend "s3" {
    bucket         = "ca-devops-ua5-terraform-state"
    key            = "terraform/47/backend.tfstate"
    region         = "eu-central-1"
    use_lockfile   = true
    encrypt        = true
  }
}
