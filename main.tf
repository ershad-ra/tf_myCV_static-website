# Call bucket module
module "bucket_resources" {
  source = "./modules/bucket"
  region = var.region
}

# Call CloudFront module
module "cloudfront_resources" {
  source                     = "./modules/cloudfront"
  region                     = var.region
  bucket_name                = module.bucket_resources.bucket_name
  bucket_arn                 = module.bucket_resources.bucket_arn
  bucket_name_regional_domain = module.bucket_resources.bucket_name_regional_domain # Pass the regional domain
  random_suffix              = module.bucket_resources.random_suffix
}

