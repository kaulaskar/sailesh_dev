#############subnet association###############
resource "aws_route_table_association" "terraform-public-1" {
  subnet_id      = aws_subnet.subnet1-public.id
  route_table_id = aws_route_table.public-rt.id
}