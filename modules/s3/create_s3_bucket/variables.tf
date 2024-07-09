variable "bucket_name" {
  description = "Name of the bucket"
  type        = string
}

variable "tag_pipeline" {
  description = "Type of pipeline - always terraform"
  default     = "terraform"
}

variable "tag_test_feature" {
  description = "What feature of AWS are you testing"
  type        = string
}

variable "timestamp" {
  description = "Timestamp"
  type        = string
}
