resource "cloudflare_dns_record" "infra_aws_certificate_validation" {
  for_each = local.domain-records
  zone_id = each.value.zone_id
  name = each.value.name
  content = each.value.content
  type = each.value.type
  ttl = each.value.ttl
  proxied = each.value.proxied
  comment = each.value.comment
}