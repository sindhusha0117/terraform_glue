provider "aws" {
  profile = "dev"
  region  = "us-east-1"
}

locals {
  # timestamp               = replace(replace(timestamp(), ":", ""), "-", "")
  # short_ts                = substr(local.timestamp, 0, 8)
  short_ts                = "20240705"
  s3_source_bucket_folder = "load_date=${local.short_ts}/"
}


module "create_s3_bucket_source" {
  source           = "./modules/s3/create_s3_bucket"
  bucket_name      = var.source_bucket_name
  tag_test_feature = var.tag_test_feature
  timestamp        = "${local.short_ts}${var.random_num}"
}

module "create_s3_bucket_transformation" {
  source           = "./modules/s3/create_s3_bucket"
  bucket_name      = var.transformed_bucket_name
  tag_test_feature = var.tag_test_feature
  timestamp        = "${local.short_ts}${var.random_num}"
}


module "create_s3_bucket_glue_catalog_db" {
  source           = "./modules/s3/create_s3_bucket"
  bucket_name      = "dev-glue-data"
  tag_test_feature = var.tag_test_feature
  timestamp        = "${local.short_ts}${var.random_num}"
}


module "create_source_folder" {
  source      = "./modules/s3/s3_upload_object"
  bucket_name = module.create_s3_bucket_source.bucket_name
  object_name = "cereal_data/${local.s3_source_bucket_folder}"
}

module "copy_cereal_data_to_source_folder" {
  source      = "./modules/s3/s3_upload_object"
  bucket_name = module.create_s3_bucket_source.bucket_name
  object_name = "cereal_data/${local.s3_source_bucket_folder}${basename(var.dataset1)}"
  source_path = var.dataset1
}


module "create_stock_source_folder_etf" {
  source      = "./modules/s3/s3_upload_object"
  bucket_name = module.create_s3_bucket_source.bucket_name
  object_name = "stock_data/stock_type=etf/"
}

module "create_stock_source_folder_stock" {
  source      = "./modules/s3/s3_upload_object"
  bucket_name = module.create_s3_bucket_source.bucket_name
  object_name = "stock_data/stock_type=stock/"
}

module "copy_etf_data_to_etf_1" {
  source      = "./modules/s3/s3_upload_object"
  bucket_name = module.create_s3_bucket_source.bucket_name
  object_name = "stock_data/stock_type=etf/hyg.us.txt"
  source_path = "./data/glue_data/stock_data/stock_type=etf/hyg.us.txt"
}

module "copy_etf_data_to_etf_2" {
  source      = "./modules/s3/s3_upload_object"
  bucket_name = module.create_s3_bucket_source.bucket_name
  object_name = "stock_data/stock_type=etf/hygh.us.txt"
  source_path = "./data/glue_data/stock_data/stock_type=etf/hygh.us.txt"
}


module "copy_stock_data_to_stock_1" {
  source      = "./modules/s3/s3_upload_object"
  bucket_name = module.create_s3_bucket_source.bucket_name
  object_name = "stock_data/stock_type=stock/a.us.txt"
  source_path = "./data/glue_data/stock_data/stock_type=stock/a.us.txt"
}

module "copy_stock_data_to_stock_2" {
  source      = "./modules/s3/s3_upload_object"
  bucket_name = module.create_s3_bucket_source.bucket_name
  object_name = "stock_data/stock_type=stock/aa.us.txt"
  source_path = "./data/glue_data/stock_data/stock_type=stock/aa.us.txt"
}

# Glue
module "create_schema_registry" {
  source        = "./modules/glue/create_glue_registry"
  registry_name = "dev_schema_registry"
}

module "create_schema_entries" {
  source       = "./modules/glue/create_glue_schema"
  registry_arn = module.create_schema_registry.registry_arn
}


module "create_dev_catalog_db" {
  source                 = "./modules/glue/create_catalog_db"
  catalog_db_name        = var.catalog_db_name
  catalog_db_s3_location = module.create_s3_bucket_glue_catalog_db.bucket_name
}


module "create_cereal_catalog_table_manual" {
  source                = "./modules/glue/create_catalog_table"
  catalog_table_name    = var.catalog_table_name_manual
  catalog_database_name = module.create_dev_catalog_db.catalog_db_name
  data_s3_location      = "s3://${module.create_s3_bucket_source.bucket_name}/cereal_data/"
  schema_arn            = module.create_schema_entries.cereal_schema_arn
}


module "create_stock_catalog_table_manual" {
  source                = "./modules/glue/create_catalog_table"
  catalog_table_name    = "stock_data"
  catalog_database_name = module.create_dev_catalog_db.catalog_db_name
  data_s3_location      = "s3://${module.create_s3_bucket_source.bucket_name}/stock_data"
  schema_arn            = module.create_schema_entries.stock_schema_arn
}
