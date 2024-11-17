provider "aws" {
  region = "eu-west-3"
}

resource "aws_s3_bucket" "bucket" {
  bucket = "ocr-p9"
}

resource "aws_s3_bucket_ownership_controls" "ownership_controls" {
  bucket = aws_s3_bucket.bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

# Désactive complètement le blocage des politiques publiques
resource "aws_s3_bucket_public_access_block" "public_access_block" {
  bucket = aws_s3_bucket.bucket.id

  block_public_acls       = false  # Permettre les ACL publiques
  block_public_policy     = false  # Permettre les politiques publiques
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "acl" {
  depends_on = [
    aws_s3_bucket_ownership_controls.ownership_controls,
    aws_s3_bucket_public_access_block.public_access_block,
  ]

  bucket = aws_s3_bucket.bucket.id
  acl    = "public-read"
}

resource "aws_s3_bucket_policy" "bucket_policy" {

  depends_on = [
    aws_s3_bucket_acl.acl,
    aws_s3_bucket_public_access_block.public_access_block,
  ]

  bucket = aws_s3_bucket.bucket.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = "*",
        Action   = "s3:GetObject",
        Resource = "${aws_s3_bucket.bucket.arn}/*"
      }
    ]
  })
}


# AWS CLI pour vider le bucket
# aws s3 rm s3://ocr-data-scientist --recursive