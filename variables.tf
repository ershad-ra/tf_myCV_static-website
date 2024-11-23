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
}
