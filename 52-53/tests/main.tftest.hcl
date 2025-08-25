run "bucket_exists" {
  description = "Check that the new bucket is created"
  condition = resource.aws_s3_bucket.oidc_bucket_dev.id != ""
}

run "bucket_name" {
  description = "Check that the bucket has the expected name"
  condition = resource.aws_s3_bucket.oidc_bucket_dev.bucket == "expected-bucket-name"
}