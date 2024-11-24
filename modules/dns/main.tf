# CNAME record for CloudFront distribution (www.cloudnex.fr)
resource "aws_route53_record" "myCV_cloudfront_cname" {
  zone_id = var.hosted_zone_id
  name    = "www.${var.domain_name}" # Subdomain CNAME
  type    = "CNAME"
  ttl     = 300
  records = [var.domain_name]
}

# Alias record for root domain (cloudnex.fr) pointing to CloudFront
resource "aws_route53_record" "myCV_cloudfront_alias" {
  zone_id = var.hosted_zone_id
  name    = var.domain_name
  type    = "A"
  alias {
    name                   = var.cloudfront_distribution_domain
    zone_id                = var.cloudfront_zone_id
    evaluate_target_health = false
  }
}
