# 1. Diciamo a Terraform che useremo AWS
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# 2. Configuriamo il provider (la "chiave" per entrare)
provider "aws" {
  region = "us-east-1"
}

# 3. Creiamo la risorsa: Il Bucket S3
resource "aws_s3_bucket" "portfolio_bucket" {
  # IMPORTANTE: Scegli un nome UNICO al mondo (es. includi numeri o il tuo nome)
  bucket = "portfolio-giuseppe-laselva-2026" 
  
  # Questo serve per poterlo distruggere anche se pieno (utile per i test)
  force_destroy = true 
}

# 4. Blocchiamo l'accesso pubblico (Best Practice di sicurezza)
resource "aws_s3_bucket_public_access_block" "block_public" {
  bucket = aws_s3_bucket.portfolio_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# 5. Output: Alla fine, dimmi come si chiama il bucket creato
output "bucket_name" {
  value = aws_s3_bucket.portfolio_bucket.id
}

####################################################
# CloudFront Origin Access Control (OAC)
# Permette a CloudFront di autenticarsi su S3
####################################################
resource "aws_cloudfront_origin_access_control" "portfolio_oac" {
  name                              = "portfolio-oac"
  description                       = "Accesso sicuro CloudFront -> S3"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

####################################################
# CloudFront Distribution
# La CDN vera e propria
####################################################
resource "aws_cloudfront_distribution" "portfolio_distribution" {
  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = "index.html" # File che carica quando visiti il dominio radice

  origin {
    domain_name              = aws_s3_bucket.portfolio_bucket.bucket_regional_domain_name
    origin_id                = "S3-portfolio-origin"
    origin_access_control_id = aws_cloudfront_origin_access_control.portfolio_oac.id
  }

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "S3-portfolio-origin"

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https" # Forza HTTPS per sicurezza
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  restrictions {
    geo_restriction {
      restriction_type = "none" # Accessibile da tutto il mondo
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true # Usa certificato predefinito *.cloudfront.net
  }
}

####################################################
# S3 Bucket Policy
# Permette a CloudFront (e SOLO a lui) di leggere i file
####################################################
resource "aws_s3_bucket_policy" "allow_cloudfront" {
  bucket = aws_s3_bucket.portfolio_bucket.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "AllowCloudFrontServicePrincipal"
        Effect    = "Allow"
        Principal = {
          Service = "cloudfront.amazonaws.com"
        }
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.portfolio_bucket.arn}/*"
        Condition = {
          StringEquals = {
            "AWS:SourceArn" = aws_cloudfront_distribution.portfolio_distribution.arn
          }
        }
      }
    ]
  })
}

output "cloudfront_domain_name" {
  value = aws_cloudfront_distribution.portfolio_distribution.domain_name
  description = "L'URL del tuo sito CloudFront"
}
