locals {
    input_bucket_name  = "${var.bucket_name}-input-${var.environment}-ua5"
    output_bucket_name = "${var.bucket_name}-output-${var.environment}-ua5"
}

resource "aws_s3_bucket" "input_bucket" {
  bucket = local.input_bucket_name

  tags = {
    Name = local.input_bucket_name
  }
}

resource "aws_s3_bucket" "output_bucket" {
  bucket = local.output_bucket_name

  tags = {
    Name = local.output_bucket_name
  }

  depends_on = [
    aws_s3_bucket.input_bucket
  ]
}

resource "aws_s3_bucket" "input_object" {
for_each = var.all_bucket_names


  bucket = each.value.name
  tags = {
    Name = each.value.tag_name
  }
    lifecycle {
        prevent_destroy = false
    }
}