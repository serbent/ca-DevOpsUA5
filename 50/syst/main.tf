locals {
  bucket_name = "${var.bucket_name}-${var.env}-devopsua5"
}


resource "aws_s3_bucket" "oidc_bucket" {
  bucket = local.bucket_name

  tags = {
    Name = local.bucket_name
    Env  = var.env
  }
}


resource "aws_s3_bucket_versioning" "oidc_bucket_versioning" {
  bucket = aws_s3_bucket.oidc_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}