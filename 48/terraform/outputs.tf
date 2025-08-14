output "bucket_name" {
  value       = aws_s3_bucket.oidc_bucket.bucket
  description = "The name of the S3 bucket used for OIDC"
}