variable "catalog_db_name" {
  description = "Name of the catalog database"
  type        = string
}

variable "catalog_db_s3_location" {
  description = "S3 path for the Glue catalog database"
  type        = string
}