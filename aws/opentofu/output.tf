output "certificateManager" {
  value = {
    arn = aws_acm_certificate.infra_certificate.arn
  }
  sensitive = true
}