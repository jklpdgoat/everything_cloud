output "public_ip" {
  description = "The Public IP address used to access the instances"
  value       = aws_instance.example.public_ip
}
