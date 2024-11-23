output "cloudfront_domain_name" {
  value = aws_cloudfront_distribution.myCV_distribution_01.domain_name
}

output "cloudfront_distribution_domain" {
  description = "CloudFront distribution domain name"
  value       = aws_cloudfront_distribution.myCV_distribution_01.domain_name
}

output "cloudfront_zone_id" {
  description = "CloudFront zone ID"
  value       = aws_cloudfront_distribution.myCV_distribution_01.hosted_zone_id
}
