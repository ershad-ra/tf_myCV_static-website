# Call bucket module
module "bucket_resources" {
  source = "./modules/bucket"
}

module "dns_resources" {
  source                          = "./modules/dns"
  hosted_zone_id                  = var.route53_hosted_zone_id
  domain_name                     = var.myCV_domain_name
  cloudfront_distribution_domain  = module.cloudfront_resources.cloudfront_distribution_domain
  cloudfront_zone_id              = module.cloudfront_resources.cloudfront_zone_id
}

module "cloudfront_resources" {
  source                     = "./modules/cloudfront"
  region                     = var.region # Pass region
  bucket_name                = module.bucket_resources.bucket_name
  bucket_arn                 = module.bucket_resources.bucket_arn
  bucket_name_regional_domain = module.bucket_resources.bucket_name_regional_domain
  random_suffix              = module.bucket_resources.random_suffix
  cloudfront_alternate_domain = var.myCV_domain_name
  acm_certificate_arn         = module.dns_resources.certificate_arn
}