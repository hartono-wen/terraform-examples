resource "aws_nat_gateway" "primary_vpc_public_nat_gateways" {
  depends_on    = [
    aws_eip.primary_vpc_public_nat_gw_elastic_ips,
    aws_subnet.primary_vpc_public_subnets
    ]

  for_each = aws_subnet.primary_vpc_public_subnets
  allocation_id = "${aws_eip.primary_vpc_public_nat_gw_elastic_ips[each.key].id}"
  subnet_id     = "${each.value.id}"
  
  tags = {
    Name        = "NAT Gateway ${each.value.availability_zone} | ${var.primary_vpc_name}"
    AZ = "${each.value.availability_zone}"
  }

}
