variable "region" {
  description = "AWS region where resources will be created"
  type        = string
}

variable "bucket_name" {
  description = "Name of the S3 bucket to use as the CloudFront origin"
  type        = string
}

variable "bucket_arn" {
  description = "ARN of the S3 bucket for policy configuration"
  type        = string
}

variable "random_suffix" {
  description = "Random suffix passed from the bucket module"
  type        = string
}

variable "bucket_name_regional_domain" {
  description = "The regional domain name of the S3 bucket"
  type        = string
}

variable "cloudfront_alternate_domain" {
  description = "Alternate domain name (CNAME) for the CloudFront distribution"
  type        = string
}

variable "acm_certificate_arn" {
  description = "ARN of the ACM Certificate for the CloudFront distribution"
  type        = string
  default     = ""
}
