resource "aws_instance" "app_server" {
  ami                         = "ami-0ee8244746ec5d6d4"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.sb_lab01.id
  vpc_security_group_ids      = [aws_security_group.sg_lab_access.id]
  associate_public_ip_address = true
  key_name                    = "lab-devops-01"

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file(var.pvt_key)
    host        = self.public_ip
  }

  provisioner "local-exec" {
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i '${self.public_ip},' -u ubuntu --private-key=${var.pvt_key} install-docker.yaml"
  }

  provisioner "file" {
    source      = "app"
    destination = "/tmp"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/app/script.sh",
      "/tmp/app/script.sh"
    ]
  }

  tags = {
    Name = var.tag_name
  }
}