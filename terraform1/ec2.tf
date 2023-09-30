resource "aws_instance" "webserver" {
  ami                         = "ami-0f5ee92e2d63afc18"
  instance_type               = "t2.micro"
  key_name                    = "desktop-key"
  associate_public_ip_address = true
  tags = {
    Name = "Server-1"
  }
}