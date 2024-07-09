resource "aws_glue_schema" "create_cereal_schema_cereal" {
  schema_name       = "cereal_schema"
  registry_arn      = var.registry_arn
  data_format       = "AVRO"
  compatibility     = "NONE"
  schema_definition = "{\"type\":\"record\", \"name\":\"r1\", \"fields\":[{\"name\":\"name\", \"type\":\"string\"}, {\"name\":\"mfr\", \"type\":\"string\"},    {\"name\":\"type\", \"type\":\"string\"},    {\"name\":\"calories\", \"type\":\"string\"},    {\"name\":\"protein\", \"type\":\"string\"},    {\"name\":\"fat\", \"type\":\"string\"},    {\"name\":\"sodium\", \"type\":\"string\"},   {\"name\":\"fiber\", \"type\":\"string\"},    {\"name\":\"carb\", \"type\":\"string\"},   {\"name\":\"sugar\", \"type\":\"string\"},  {\"name\":\"potass\", \"type\":\"string\"},{\"name\":\"vitamins\", \"type\":\"string\"}, {\"name\":\"shelf\", \"type\":\"string\"}, {\"name\":\"weight\", \"type\":\"string\"},{\"name\":\"cups\", \"type\":\"string\"},{\"name\":\"rating\", \"type\":\"string\"} ]}"
}


resource "aws_glue_schema" "create_stock_schema" {
  schema_name       = "stock_schema"
  registry_arn      = var.registry_arn
  data_format       = "AVRO"
  compatibility     = "NONE"
  schema_definition = "{\"type\" : \"record\", \"name\":\"r1\", \"fields\":[{\"name\":\"date\", \"type\":\"string\"},{\"name\":\"open\", \"type\":\"string\"},{\"name\":\"high\", \"type\":\"string\"},{\"name\":\"low\", \"type\":\"string\"},{\"name\":\"close\", \"type\":\"string\"},{\"name\":\"volume\", \"type\":\"string\"},{\"name\":\"open_int\", \"type\":\"string\"}]}"
}