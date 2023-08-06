resource "aws_s3_bucket" "state_backend" {
  bucket = var.bucket_name

  lifecycle {
    prevent_destroy = false
  }

}

resource "aws_s3_bucket_versioning" "s3_versioning" {
  bucket = aws_s3_bucket.state_backend.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "s3_encrypt" {
    bucket = aws_s3_bucket.state_backend.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }

}

resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket                  = aws_s3_bucket.state_backend.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true


}