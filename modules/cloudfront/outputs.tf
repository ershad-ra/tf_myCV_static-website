output "cloudfront_domain_name" {
  value = aws_cloudfront_distribution.myCV_distribution_01.domain_name
}