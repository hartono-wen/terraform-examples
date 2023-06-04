primary_vpc_name = "Primary Staging VPC"
primary_vpc_cidr_block = "10.110.0.0/16"
primary_vpc_private_subnet_lists = {
    "ap-southeast-3a" = "10.110.71.0/24"
    "ap-southeast-3b" = "10.110.72.0/24"
    "ap-southeast-3c" = "10.110.73.0/24"
}
primary_vpc_public_subnet_lists = {
    "ap-southeast-3a" = "10.110.11.0/24"
    "ap-southeast-3b" = "10.110.12.0/24"
    "ap-southeast-3c" = "10.110.13.0/24"
}
additional_tags = {
    Environment = "staging"
}