##########ec2-instance#################

# resource "aws_instance" "server-1" {
#   count = 2
#   ami = var.ami
#   instance_type               = var.instance_type
#   key_name                    = var.key_name
#   subnet_id                   = element(aws_subnet.subnet-public.*.id, count.index)
#   vpc_security_group_ids      = [aws_security_group.allow_all.id]
#   associate_public_ip_address = true
#   tags = {
#     Name       = var.server_name
#   }
# }


resource "aws_instance" "server-1" {
  count = (var.env == "prod" ? 2 : 1)  # if env is prod then two instances will be deployed or else 1 instance will be deployed 
  ami = lookup(var.ami, var.region)
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = element(aws_subnet.subnet-public.*.id, count.index)
  vpc_security_group_ids      = [aws_security_group.allow_all.id]
  associate_public_ip_address = true
  tags = {
    Name       = var.server_name
  }
}
