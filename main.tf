# Call bucket module
module "bucket_resources" {
  source = "./modules/bucket"
  region = var.region
}

module "dns_resources" {
  source                     = "./modules/dns"
  acm_certificate_arn      = var.acm_certificate_arn # Use certificate from input
  domain_name                = "cloudnex.fr"
  cloudfront_distribution_domain = module.cloudfront_resources.cloudfront_domain_name
  cloudfront_alternate_domain    = var.cloudfront_alternate_domain
}

module "cloudfront_resources" {
  source                     = "./modules/cloudfront"
  region                     = var.region # Pass region
  bucket_name                = module.bucket_resources.bucket_name
  bucket_arn                 = module.bucket_resources.bucket_arn
  bucket_name_regional_domain = module.bucket_resources.bucket_name_regional_domain
  random_suffix              = module.bucket_resources.random_suffix
  cloudfront_alternate_domain = var.cloudfront_alternate_domain
  acm_certificate_arn        = module.dns_resources.acm_certificate_arn # Use validated ARN
}
