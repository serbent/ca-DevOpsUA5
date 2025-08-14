resource "aws_s3_bucket" "oidc_bucket" {
  bucket = var.bucket_name

  tags = {
    Name = "oidc-bucket"
  }
}

