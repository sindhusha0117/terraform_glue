resource "aws_s3_bucket" "create_s3_bucket" {
  bucket = "${var.bucket_name}-${var.timestamp}-${var.tag_pipeline}-${var.tag_test_feature}"
  force_destroy = true

  tags = {
    pipeline     = var.tag_pipeline
    test_feature = var.tag_test_feature
  }
}

