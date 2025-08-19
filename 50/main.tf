locals {
  bucket_name = "${var.bucket_name}-${var.env}-devopsua5"
}


resource "aws_s3_bucket" "oidc_bucket" {
  bucket = local.bucket_name

  tags = {
    Name = "oidc-bucket"
  }
}