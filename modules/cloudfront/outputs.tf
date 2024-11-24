output "cloudfront_distribution_domain" {
  description = "CloudFront distribution domain name"
  value       = aws_cloudfront_distribution.myCV_distribution_01.domain_name
}

output "cloudfront_zone_id" {
  description = "Zone ID for the CloudFront distribution"
  value       = aws_cloudfront_distribution.myCV_distribution_01.hosted_zone_id
}
