/*
Required parameters 
1. name
2. location_uri

Next:
1. Parameters
2. Federated database - connection_name, identifier
3. target_database - catalog_id, database name, region

 */

resource "aws_glue_catalog_database" "create_catalog_db" {
  name         = var.catalog_db_name
  location_uri = var.catalog_db_s3_location

}