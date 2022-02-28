output "aws_macie2_account" {
  description = "Macie Account"
  value       = var.enable ? aws_macie2_account.self[0] : null
}
