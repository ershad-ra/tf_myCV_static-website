# Create the DNS Zone
resource "aws_route53_zone" "myCV_dns_zone" {
  name = var.domain_name
}

# ACM Certificate
resource "aws_acm_certificate" "myCV_ssl_certificate" {
  domain_name       = var.cloudfront_alternate_domain
  validation_method = "DNS"
  tags = {
    Name = "CloudNex Certificate"
  }
}

# Create DNS validation records for ACM Certificate
resource "aws_route53_record" "myCV_ssl_validation_cname" {
  for_each = {
    for dvo in aws_acm_certificate.myCV_ssl_certificate.domain_validation_options : dvo.domain_name => {
      name  = dvo.resource_record_name
      type  = dvo.resource_record_type
      value = dvo.resource_record_value
    }
  }

  zone_id = aws_route53_zone.myCV_dns_zone.zone_id
  name    = each.value.name
  type    = each.value.type
  ttl     = 300 # Default TTL for validation records
  records = [each.value.value]
}

# Wait for ACM Certificate validation
resource "aws_acm_certificate_validation" "myCV_ssl_validation" {
  certificate_arn         = aws_acm_certificate.myCV_ssl_certificate.arn
  validation_record_fqdns = [for record in aws_route53_record.myCV_ssl_validation_cname : record.fqdn]
}

# CNAME record to map cloudnex.fr to CloudFront domain
resource "aws_route53_record" "myCV_cloudfront_cname" {
  zone_id = aws_route53_zone.myCV_dns_zone.zone_id
  name    = var.domain_name # This is "cloudnex.fr"
  type    = "CNAME"
  ttl     = 300 # Default TTL, adjust if needed
  records = [var.cloudfront_distribution_domain]
}
