# CloudFront Origin Access Control
resource "aws_cloudfront_origin_access_control" "myCV_oac_01" {
  name                               = "myCV-oac-${var.random_suffix}"
  origin_access_control_origin_type  = "s3"
  signing_behavior                   = "always"
  signing_protocol                   = "sigv4"
}

# CloudFront Distribution
resource "aws_cloudfront_distribution" "myCV_distribution_01" {
  origin {
    # Use the bucket's regional domain name
    domain_name = var.bucket_name_regional_domain
    origin_id   = "S3-${var.bucket_name}"

    origin_access_control_id = aws_cloudfront_origin_access_control.myCV_oac_01.id
  }

  default_cache_behavior {
    target_origin_id       = "S3-${var.bucket_name}"
    viewer_protocol_policy = "redirect-to-https"

    allowed_methods = ["GET", "HEAD"]
    cached_methods  = ["GET", "HEAD"]

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }
  }

  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = "index.html"

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }
}

# Bucket Policy for CloudFront Access
resource "aws_s3_bucket_policy" "myCV_bucket_policy_01" {
  bucket = var.bucket_name
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "cloudfront.amazonaws.com"
        }
        Action   = "s3:GetObject"
        Resource = "${var.bucket_arn}/*"
        Condition = {
          StringEquals = {
            "AWS:SourceArn" = aws_cloudfront_distribution.myCV_distribution_01.arn
          }
        }
      }
    ]
  })
}
