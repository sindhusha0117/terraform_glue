variable "catalog_table_name" {
  description = "Name of the catalog table"
  type        = string
}


variable "catalog_database_name" {
  description = "Name of the catalog database the table needs to be created in"
  type        = string
}

variable "data_s3_location" {
  description = "Location of the file"
  type        = string
}

variable "schema_arn" {
  description = "ARN of the schema"
  type        = string
}