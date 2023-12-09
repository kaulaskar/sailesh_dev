output vpc_id {
  value       = aws_vpc.main.id
}


output public_subnets_id {
  value       = "aws_subnet.subnet1-public.id"
}



output internetgatway {
  value       = "aws_internet_gateway.IGW.id"
}