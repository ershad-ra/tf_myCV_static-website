output "bucket_name" {
  value = module.bucket_resources.bucket_name
}

output "cloudfront_distribution_domain" {
  value = module.cloudfront_resources.cloudfront_domain_name
}

output "dns_zone_id" {
  value = module.dns_resources.dns_zone_id
}

output "domain_name" {
  value = module.dns_resources.domain_name
}

output "acm_certificate_arn" {
  description = "ARN of the ACM Certificate"
  value       = module.dns_resources.acm_certificate_arn
}
