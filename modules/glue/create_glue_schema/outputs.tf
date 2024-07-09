output "cereal_schema_arn" {
  value = aws_glue_schema.create_cereal_schema_cereal.arn
}

output "stock_schema_arn" {
  value = aws_glue_schema.create_stock_schema.arn
}