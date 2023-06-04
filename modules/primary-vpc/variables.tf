variable "primary_vpc_name" {
  description = "Primary VPC"
  type        = string
  default     = "Primary VPC"
}

variable "primary_vpc_cidr_block" {
  description = "CIDR block for Primary VPC"
  type        = string
  default     = "10.180.0.0/16"
}

variable "primary_vpc_private_subnet_lists" {
  description = "Map of private subnet CIDR block for Primary VPC."
  type        = map(string)
  default = {
      "ap-southeast-3a" = "10.180.71.0/24"
      "ap-southeast-3b" = "10.180.72.0/24"
      "ap-southeast-3c" = "10.180.73.0/24"
  }
}

variable "primary_vpc_public_subnet_lists" {
  description = "Map of public subnet CIDR block for Primary VPC."
  type        = map(string)
  default = {
      "ap-southeast-3a" = "10.180.11.0/24"
      "ap-southeast-3b" = "10.180.12.0/24"
      "ap-southeast-3c" = "10.180.13.0/24"
  }
}

variable "additional_tags" {
  default     = {}
  description = "Additional resource tags"
  type        = map(string)
}