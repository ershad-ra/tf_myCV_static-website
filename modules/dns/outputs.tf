output "dns_zone_id" {
  description = "ID of the Route 53 DNS zone"
  value       = aws_route53_zone.myCV_dns_zone.zone_id
}

output "domain_name" {
  description = "Domain name with HTTPS"
  value       = "https://${var.cloudfront_alternate_domain}"
}

output "acm_certificate_arn" {
  description = "ARN of the validated ACM Certificate"
  value       = aws_acm_certificate_validation.myCV_ssl_validation.certificate_arn
}

