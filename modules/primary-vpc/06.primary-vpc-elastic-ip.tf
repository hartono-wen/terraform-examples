resource "aws_eip" "primary_vpc_public_nat_gw_elastic_ips" {
  depends_on  = [aws_internet_gateway.primary_vpc_internet_gw]

  for_each    = aws_subnet.primary_vpc_private_subnets
  vpc         = true

  tags = merge(
    var.additional_tags,
    {
      Name        = "NAT EIP - ${each.value.availability_zone} | ${var.primary_vpc_name}"
      AZ          = "${each.key}"
    }
  )

}