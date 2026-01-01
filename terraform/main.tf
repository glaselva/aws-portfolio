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
