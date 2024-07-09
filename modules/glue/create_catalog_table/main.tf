/*
Required 
1. Name
2. database name

Next -
** Partition index - index_name, keys
    -> Cannot be added to existing glue_catalog_table.
** partition key - key name, type, comment
retention
Storage descriptor - 
    location, 
    additional_locations, 
    ** bucket_columns, 
    columns (name, parameters, type)
    compressed, 
    input_format, 
    location, 
    ** number of buckets, 
    output format, 
    ** schema reference, 
    ** skewed info (skewed column names, skewed column value location maps, skewed column values), 
    ** sort column (column name, sort order), 
    ** stored as sub directories
** table type - external_table, virtual view etc.
Schema reference - 
    schema_id(registry name, schema arn, schema name), 
    schema_version_id, 
    schema_version_number
*/

resource "aws_glue_catalog_table" "create_catalog_table" {
  name          = var.catalog_table_name
  database_name = var.catalog_database_name
  table_type    = "EXTERNAL_TABLE"
  storage_descriptor {
    location      = var.data_s3_location
    input_format  = "org.apache.hadoop.mapred.TextInputFormat"
    output_format = "org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat"

    ser_de_info {
      name                  = "OpenCSVSerde"
      serialization_library = "org.apache.hadoop.hive.serde2.OpenCSVSerde"
      parameters = {
        "separatorChar" = ","
        "quoteChar"     = "\""
        "escapeChar"    = "\\"
      }
    }

    schema_reference {
      schema_id {
        schema_arn = var.schema_arn
      }
      schema_version_number = 1
    }
  }

}