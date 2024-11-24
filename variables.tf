variable "region" {
  description = "AWS region to deploy resources in"
  default     = "us-east-1"
}

variable "myCV_domain_name" {
  description = "Alternate domain name (CNAME) for the CloudFront distribution"
  type        = string
  default     = "your_domain.com"
}

variable "acm_certificate_arn" {
  description = "ARN of the ACM Certificate for the CloudFront distribution"
  type        = string
  default = "arn:aws_of_your_certificate"
}

variable "route53_hosted_zone_id" {
  description = "ID of the manually created Route 53 hosted zone"
  type        = string
  default = "zone_id_of_your_dns_zone"
}