output "CertificateManager" {
  value = {
    arn = aws_acm_certificate.infra_certificate.arn
  }
}