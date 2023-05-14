output "primary_vpc_id" {
  description = "The VPC ID of the primary VPC"
  value = aws_vpc.primary_vpc.id
}

