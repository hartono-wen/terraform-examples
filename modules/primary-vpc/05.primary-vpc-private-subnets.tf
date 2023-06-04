resource "aws_subnet" "primary_vpc_private_subnets" {
  depends_on = [aws_internet_gateway.primary_vpc_internet_gw]

  for_each = var.primary_vpc_private_subnet_lists

  vpc_id                  = "${aws_vpc.primary_vpc.id}"
  cidr_block              = "${each.value}"
  availability_zone       = "${each.key}"
  map_public_ip_on_launch = false

  tags = merge(
    var.additional_tags,
    {
      Name        = "Private Subnet ${each.key} | ${var.primary_vpc_name} | ${aws_vpc.primary_vpc.id}"
    }
  )

}
