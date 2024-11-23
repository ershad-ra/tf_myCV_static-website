# Random ID for uniqueness
resource "random_id" "myCV_bucket_suffix" {
  byte_length = 4
}

# S3 Bucket for static website
resource "aws_s3_bucket" "myCV_bucket_01" {
  bucket        = "mycv-static-website-${random_id.myCV_bucket_suffix.hex}" # Unique bucket name
  force_destroy = true # Allow deletion of bucket with objects
}

# Block public access using a separate resource
resource "aws_s3_bucket_public_access_block" "myCV_bucket_public_access" {
  bucket                  = aws_s3_bucket.myCV_bucket_01.id # Attach to the created bucket
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Upload website files to S3 using the updated `aws_s3_object` resource
resource "aws_s3_object" "myCV_bucket_files" {
  for_each = fileset("${path.module}/../../website_files", "*")

  bucket = aws_s3_bucket.myCV_bucket_01.id
  key    = each.key
  source = "${path.module}/../../website_files/${each.key}"

  # Fix for content type based on file extension
  content_type = lookup({
    "html" = "text/html",
    "css"  = "text/css",
    "jfif" = "image/jpeg"
  }, regex("^.*\\.(\\w+)$", each.key)[0], "application/octet-stream")
}
