provider "aws" {
  region = "us-east-1"
}

module "create_s3_bucket_standalone" {
  source           = "C:/Users/sindh/Desktop/projects/terraform_glue/modules/s3"
  bucket_name      = "sin-test01-0117"
  tag_test_feature = "s3_standalone"
}
