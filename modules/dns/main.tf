resource "aws_route53_zone" "main" {
  name = var.domain_name
  force_destroy = true
}


# CNAME record for CloudFront distribution (www.cloudnex.fr)
resource "aws_route53_record" "cname" {
  zone_id = var.hosted_zone_id
  name    = "www.${var.domain_name}" # Subdomain CNAME
  type    = "CNAME"
  ttl     = 300
  records = [var.domain_name]
}

# Alias record for root domain (cloudnex.fr) pointing to CloudFront
resource "aws_route53_record" "alias" {
  zone_id = var.hosted_zone_id
  name    = var.domain_name
  type    = "A"
  alias {
    name                   = var.cloudfront_distribution_domain
    zone_id                = var.cloudfront_zone_id
    evaluate_target_health = false
  }
}

module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "~> 4.0"

  domain_name  = var.domain_name
  zone_id      = aws_route53_zone.main.zone_id

  validation_method = "DNS"

  # subject_alternative_names = [
  #   "*.my-domain.com",
  #   "app.sub.my-domain.com",
  # ]

  wait_for_validation = true

  tags = {
    Name = var.domain_name
  }
}