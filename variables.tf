variable "source_bucket_name" {
  description = "S3 bucket name for the source data"
  default     = "sin-source"
}

variable "transformed_bucket_name" {
  description = "S3 bucket name to store the Glue ETL transformed data"
  default     = "sin-transformed"
}

variable "tag_test_feature" {
  description = "Provides the tag value in context of the feature being tested"
  default     = "s3-glue"
}

variable "dataset1" {
  description = "Dataset1 to test Glue"
  default     = "./data/glue_data/cereal.csv"
}

variable "stock_dataset" {
  description = "stock_dataset"
  default     = "./data/glue_data/stock_data/"
}

variable "random_num" {
  default = 790
}

variable "catalog_db_name" {
  description = "Name of the glue catalog database name"
  default     = "dev_catalog"
}

variable "catalog_table_name_manual" {
  description = "Name of the Glue catalog table name"
  default     = "cereal_tbl_manual"
}

variable "catalog_table_name_auto" {
  description = "Name of the Glue catalog table name"
  default     = "dev_tbl_auto"
}


variable "s3_stock_source_bucket_folder" {
  description = "Folder name/key to store the stock data"
  default     = "stock_data"
}