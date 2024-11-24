variable "region" {
  description = "AWS region to deploy resources in"
  default     = "us-east-1"
}

variable "cloudfront_alternate_domain" {
  description = "Alternate domain name (CNAME) for the CloudFront distribution"
  type        = string
  default     = "cloudnex.fr"
}

variable "acm_certificate_arn" {
  description = "ARN of the ACM Certificate for the CloudFront distribution"
  type        = string
  default = "arn:aws:acm:us-east-1:122610520522:certificate/ac4e27e4-c5fd-45a1-ad18-b6e561361f35"
}

variable "route53_hosted_zone_id" {
  description = "ID of the manually created Route 53 hosted zone"
  type        = string
  default = "Z0387201OIOFRHIZL7S4"
}