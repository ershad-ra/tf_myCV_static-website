output "bucket_name" {
  value = module.bucket_resources.bucket_name
}

output "cloudfront_distribution_domain" {
  value = module.cloudfront_resources.cloudfront_distribution_domain
}

output "myCV_is_reachable_at" {
  value = var.cloudfront_alternate_domain
}