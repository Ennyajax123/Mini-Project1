output "front-end_public_dns" {
  value = aws_instance.front-end.public_dns
}

output "backend_public_dns" {
  value = aws_instance.backend.public_dns
}

output "Databaseend_public_dns" {
  value = aws_instance.backend.public_dns
}