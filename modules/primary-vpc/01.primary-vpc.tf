resource "aws_vpc" "primary_vpc" {
  cidr_block           = "${var.primary_vpc_cidr_block}"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = merge(
    var.additional_tags,
    {
      Name        = "${var.primary_vpc_name}"
    },
  )
  
}
