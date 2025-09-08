provider "aws" {
  region = var.aws_region
}

terraform {
  # no remote backend configured by default; user can configure in their environment
}
