resource "aws_instance" "app_server" {
  ami           = "ami-0ee8244746ec5d6d4"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.sb_lab01.id
  vpc_security_group_ids = [aws_security_group.sg_lab_access.id]
  associate_public_ip_address = true
  key_name = "lab-devops-01"

  tags = {
    Name = var.tag_name
  }
}