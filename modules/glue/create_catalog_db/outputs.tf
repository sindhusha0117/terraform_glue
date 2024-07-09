output "catalog_db_arn" {
  value = aws_glue_catalog_database.create_catalog_db.arn
}

output "catalog_db_name" {
  value = aws_glue_catalog_database.create_catalog_db.name
}