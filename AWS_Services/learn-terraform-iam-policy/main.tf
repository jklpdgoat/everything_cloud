provider "aws" {
  region = var.region

  default_tags {
    tags = {
      Hashicorp-Learn = "aws-iam-policy"
    }
  }

}

resource "random_pet" "pet_name" {
  length    = 3
  separator = "-"
}

resource "aws_iam_user" "new_user" {
  name = "new_user"
}

resource "aws_s3_bucket" "bucket" {
  bucket = "${random_pet.pet_name.id}-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_acl" "bucket" {
  bucket = aws_s3_bucket.bucket.id

  acl = "private"
}

resource "aws_iam_policy" "policy" {
  name        = "${random_pet.pet_name.id}-policy"
  description = "My test policy"

  policy = data.aws_iam_policy_document.example.json

  /*
  policy = <<EOT
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:ListAllMyBuckets"
      ],
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Action": [
        "s3:*"
      ],
      "Effect": "Allow",
      "Resource": "${aws_s3_bucket.bucket.arn}"
    }

  ]
}
EOT
  */
}

resource "aws_iam_user_policy_attachment" "attachment" {
  user       = aws_iam_user.new_user.name
  policy_arn = aws_iam_policy.policy.arn
}

data "aws_iam_policy_document" "example" {
  statement {
    actions   = ["s3:ListAllMyBuckets"]
    resources = ["arn:aws:s3:::*"]
    effect    = "Allow"
  }

  statement {
    actions   = ["s3:*"]
    resources = [aws_s3_bucket.bucket.arn]
    effect    = "Allow"
  }
}
