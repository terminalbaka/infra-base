resource "aws_acm_certificate" "infra_certificate" {
  domain_name       = var.domain
  subject_alternative_names = [
    "*.${var.domain}"
  ]
  lifecycle {
    create_before_destroy = true
  }

  validation_method = "DNS"
}