output "frontend-1_public_dns" {
  value = aws_instance.frontend-1.public_dns
}

output "backend-1_public_dns" {
  value = aws_instance.backend-1.public_dns
}

output "database-1_public_dns" {
  value = aws_instance.database-1.public_dns
}

output "frontend-2_public_dns" {
  value = aws_instance.frontend-2.public_dns
}

output "backend-2_public_dns" {
  value = aws_instance.backend-2.public_dns
}

output "database-2_public_dns" {
  value = aws_instance.database-2.public_dns
}
