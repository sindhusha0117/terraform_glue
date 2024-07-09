resource "aws_glue_registry" "create_registry" {
  registry_name = var.registry_name
  tags = {
    pipeline = "terraform"
  }
}