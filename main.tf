provider "aws" {
  region = "us-east-1"
}

locals {
  timestamp = replace(replace(timestamp(), ":", ""), "-", "")
  short_ts  = substr(local.timestamp, 0, 8)
}

resource "random_integer" "random_number" {
  min = 1
  max = 999
}

module "create_s3_bucket_source" {
  source           = "./modules/s3/create_s3_bucket"
  bucket_name      = "sin-source"
  tag_test_feature = "s3-glue"
  timestamp        = "${local.short_ts}${random_integer.random_number.result}"
}

module "create_s3_bucket_transformation" {
  source           = "./modules/s3/create_s3_bucket"
  bucket_name      = "sin-transformed"
  tag_test_feature = "s3-glue"
  timestamp        = "${local.short_ts}${random_integer.random_number.result}"
}

module "create_source_folder" {
  source      = "./modules/s3/s3_upload_object"
  bucket_name = module.create_s3_bucket_source.bucket_name
  object_name = "load_date=${local.short_ts}/"
}


