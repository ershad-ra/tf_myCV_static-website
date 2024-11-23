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