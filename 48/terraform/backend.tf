terraform {
  backend "s3" {
    bucket         = "ca-devops-ua5-terraform-state"
    key            = "terraform/48/test.tfstate"
    region         = "eu-central-1"
    use_lockfile   = true
    encrypt        = true
  }
}
