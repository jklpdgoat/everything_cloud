provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      hashicorp-learn = "console"
    }
  }
}

resource "aws_s3_bucket" "data" {
  bucket_prefix = var.bucket_prefix

  force_destroy = true
}

resource "aws_s3_bucket_acl" "data" {
  bucket = aws_s3_bucket.data.id
  acl    = "private"
}

data "aws_s3_objects" "data_bucket" {
  bucket = aws_s3_bucket.data.bucket
}

resource "aws_s3_bucket_policy" "public_read" {
  bucket = aws_s3_bucket.data.id

  policy = jsonencode({
    "Statement" = [
      {
        "Action" = [
          "s3:GetObject",
          "s3:GetObjectVersion",
        ]
        "Effect"    = "Allow"
        "Principal" = "*"
        "Resource" = [
          "${aws_s3_bucket.data.arn}/*",
        ]
        "Sid" = "PublicRead"
      },
    ]
    "Version" = "2012-10-17"
  })
}
