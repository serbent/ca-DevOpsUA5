variable "bucket_name" {
  type        = string
  default     = "converter-doc-to-pdf"
  description = "The name of the bucket for converter application"
}

variable "environment" {
  type        = string
  default     = "dev"
  description = "The environment for the application"
}

variable "all_bucket_names" {
  type        = map(any)
  default     = {
    input = {
      name = "converter-doc-to-pdf-input-dev-ua5-var"
      tag_name = "Input Bucket"
      prevent_destroy = true
    },
    output = {
      name = "converter-doc-to-pdf-output-dev-ua5-var"
      tag_name = "Output Bucket"
      prevent_destroy = false
    }
  }
  description = "List of all bucket names"
} 