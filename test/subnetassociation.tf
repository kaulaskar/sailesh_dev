#############subnet association###############

resource "aws_route_table_association" "Public_rt_as" {
  # count =3
  count = length(aws_subnet.subnet-public.*.id)
  subnet_id      = element(aws_subnet.subnet-public.*.id, count.index)
  route_table_id = aws_route_table.public_rt.id
}


resource "aws_route_table_association" "private_rt_as" {
  count = 3
  subnet_id      = element(aws_subnet.subnet-private.*.id, count.index)
  route_table_id = aws_route_table.private_rt.id
}