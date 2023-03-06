variable "instance_type" {
  description = "Type of EC2 instance to use"
  type        = string
}

variable "tags" {
  description = "Tags for instances"
  type        = map
  default     = {}
}

variable "aws_region" {
  type        = string
  default     = "ap-southeast-2"
  description = "AWS region for all resources"
}
