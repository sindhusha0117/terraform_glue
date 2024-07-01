resource "aws_s3_bucket" "create_s3_bucket" {
  bucket = var.bucket_name

  tags = {
    pipeline     = var.tag_pipeline
    test_feature = var.tag_test_feature
  }
}