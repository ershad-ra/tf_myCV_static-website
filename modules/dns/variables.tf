variable "domain_name" {
  description = "Domain name for the DNS zone"
  type        = string
}

variable "cloudfront_distribution_domain" {
  description = "CloudFront distribution domain name"
  type        = string
}

variable "cloudfront_alternate_domain" {
  description = "Alternate domain (CNAME) for the CloudFront distribution"
  type        = string
}

variable "ttl" {
  description = "TTL for DNS records"
  type        = number
  default     = 60
}

variable "acm_certificate_arn" {
  description = "ARN of the ACM Certificate for the CloudFront distribution"
  type        = string
}