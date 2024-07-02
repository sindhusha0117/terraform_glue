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