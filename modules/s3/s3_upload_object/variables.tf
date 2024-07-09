variable "bucket_name" {
  description = "Name of the bucket"
  type        = string
}


variable "object_name" {
  description = "Name of the folder that needs to be created within the bucket"
  type        = string
}

variable "source_path" {
  description = "Source path for the file"
  type        = string
  default     = ""
}
