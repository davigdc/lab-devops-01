output "instance_public_ip" {
  description = "IP público do server EC2"
  value       = aws_instance.app_server.public_ip
}