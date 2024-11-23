output "bucket_name_regional_domain" {
  description = "The regional domain name of the S3 bucket"
  value       = aws_s3_bucket.myCV_bucket_01.bucket_regional_domain_name
}

# Output the bucket name and ARN
output "bucket_name" {
  value = aws_s3_bucket.myCV_bucket_01.bucket
}

output "bucket_arn" {
  value = aws_s3_bucket.myCV_bucket_01.arn
}

output "random_suffix" {
  description = "Random suffix for the bucket name"
  value       = random_id.myCV_bucket_suffix.hex
}