resource "local_file" "inventory-file" {
  content = templatefile("detail.tpl",
    {

      testserver01    = aws_instance.server.0.public_ip
      testserver02    = aws_instance.server.1.public_ip
      testserver03    = aws_instance.server.2.public_ip
      pvttestserver01 = aws_instance.server.0.private_ip
      pvttestserver02 = aws_instance.server.1.private_ip
      pvttestserver03 = aws_instance.server.2.private_ip
    }
  )
  filename = "invfile"
}