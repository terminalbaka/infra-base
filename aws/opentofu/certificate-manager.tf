resource "aws_acm_certificate" "infra_certificate" {
  domain_name       = var.domain
  subject_alternative_names = [
    "*.${var.domain}"
  ]
  validation_method = "DNS"
}