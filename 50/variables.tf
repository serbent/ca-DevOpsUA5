variable "env" {
  type        = string
  default     = ""
  description = "environment name, e.g. dev, prod"
}

variable "bucket_name" {
  type        = string
  default     = "oidc-bucket"
  description = "Name of the S3 bucket to be created"
}