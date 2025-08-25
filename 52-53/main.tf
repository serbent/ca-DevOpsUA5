resource "aws_s3_bucket" "oidc_bucket_dev" {
  bucket = "oidc-bucket-dev-devopsua5"
  tags = {
    "Env"  = "dev"
    "Name" = "oidc-bucket-dev-devopsua5"
  }
  tags_all = {
    "Env"  = "dev"
    "Name" = "oidc-bucket-dev-devopsua5"
  }
}