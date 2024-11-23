output "bucket_name" {
  value = module.bucket_resources.bucket_name
}

output "cloudfront_distribution_domain" {
  value = module.cloudfront_resources.cloudfront_domain_name
}
