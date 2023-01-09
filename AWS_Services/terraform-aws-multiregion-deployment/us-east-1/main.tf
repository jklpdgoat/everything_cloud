





module "static_website" {
  source = "../modules/aws-s3-bucket"

  bucket_name = var.s3_bucket_name

  tags = {
    Terraform   = "true"
    Environment = "test"
  }
}
