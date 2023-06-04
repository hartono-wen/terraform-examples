resource "aws_route_table" "primary_vpc_public_route_tbl" {
  depends_on = [aws_internet_gateway.primary_vpc_internet_gw]
  
  vpc_id = "${aws_vpc.primary_vpc.id}"

  tags = merge(
    var.additional_tags,
    {
      Name        = "Public Route Table | ${var.primary_vpc_name} | ${aws_vpc.primary_vpc.id}"
    }
  )

}

resource "aws_route" "public_route_primary_vpc_internet_gw" {
  depends_on = [aws_route_table.primary_vpc_public_route_tbl]

  route_table_id         = "${aws_route_table.primary_vpc_public_route_tbl.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.primary_vpc_internet_gw.id}"

}

resource "aws_route_table_association" "primary_vpc_public_route_tbl_assoc" {
  depends_on = [
    aws_route_table.primary_vpc_public_route_tbl,
    aws_subnet.primary_vpc_public_subnets
  ]

  for_each = aws_subnet.primary_vpc_public_subnets
  subnet_id      = "${each.value.id}"
  route_table_id = "${aws_route_table.primary_vpc_public_route_tbl.id}"

}
