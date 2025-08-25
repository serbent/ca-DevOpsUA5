run "bucket_check" {
  command = apply

  variables {
    # Add vars if needed
  }

  assert {
    condition     = aws_s3_bucket.oidc_bucket_dev.bucket == "oidc-bucket-dev-devopsua5"
    error_message = "Bucket name is not set correctly"
  }

  assert {
    condition     = aws_s3_bucket.oidc_bucket_dev.tags["Env"] == "dev"
    error_message = "Bucket Env tag is not 'dev'"
  }

  assert {
    condition     = aws_s3_bucket.oidc_bucket_dev.tags["Name"] == "oidc-bucket-dev-devopsua5"
    error_message = "Bucket Name tag is not correct"
  }

  assert {
    condition     = aws_s3_bucket.oidc_bucket_dev.tags_all["Env"] == "dev"
    error_message = "tags_all Env is not correct"
  }
}
