output "certificateManager" {
  value = {
    validations = aws_acm_certificate.infra_certificate.domain_validation_options
  }
  sensitive = true
}