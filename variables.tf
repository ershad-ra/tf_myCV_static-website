variable "region" {
  description = "AWS region to deploy resources in"
  default     = "add_the_data_here"
}

variable "myCV_domain_name" {
  description = "Alternate domain name (CNAME) for the CloudFront distribution"
  type        = string
  default     = "add_the_data_here"
}

variable "route53_hosted_zone_id" {
  description = "ID of the manually created Route 53 hosted zone"
  type        = string
  default = "add_the_data_here"
}