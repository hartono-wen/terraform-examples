resource "aws_route_table" "primary_vpc_private_route_tbls" {
  depends_on = [aws_nat_gateway.primary_vpc_public_nat_gateways]
  
  for_each = aws_nat_gateway.primary_vpc_public_nat_gateways
  vpc_id = "${aws_vpc.primary_vpc.id}"

  tags = merge(
    var.additional_tags,
    {
      Name        = "Private Route Table - ${each.value.tags.AZ} | ${var.primary_vpc_name} | ${aws_vpc.primary_vpc.id}"
      AZ          = "${each.value.tags.AZ}"
    }
  )

}

resource "aws_route" "primary_vpc_private_nat_gateway_route" {
  depends_on = [
     aws_route_table.primary_vpc_private_route_tbls,
     aws_nat_gateway.primary_vpc_public_nat_gateways
  ]

  for_each = aws_route_table.primary_vpc_private_route_tbls
  route_table_id         = "${each.value.id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${aws_nat_gateway.primary_vpc_public_nat_gateways[each.value.tags.AZ].id}"

}

resource "aws_route_table_association" "private_route_tbl_assoc" {
  depends_on = [
    aws_route_table.primary_vpc_private_route_tbls,
    aws_subnet.primary_vpc_private_subnets
  ]

  for_each = aws_subnet.primary_vpc_private_subnets
  subnet_id      = "${each.value.id}"
  route_table_id = "${aws_route_table.primary_vpc_private_route_tbls[each.value.availability_zone].id}"

}
