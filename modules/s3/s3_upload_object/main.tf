
resource "aws_s3_object" "upload_object" {
  bucket = var.bucket_name
  key    = var.object_name
}