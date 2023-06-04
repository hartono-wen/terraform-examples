resource "aws_internet_gateway" "primary_vpc_internet_gw" {
  depends_on = [aws_vpc.primary_vpc]
  
  vpc_id = "${aws_vpc.primary_vpc.id}"

  tags = merge(
    var.additional_tags,
    {
      Name        = "Primary VPC IGW | ${var.primary_vpc_name} | ${aws_vpc.primary_vpc.id}"
    }
  )
  
}
