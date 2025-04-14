resource "cloudflare_dns_record" "infra_dns_record" {
  for_each = local.domain-records
  zone_id = each.value.zone_id
  name = each.value.name
  content = each.value.content
  type = each.value.type
  ttl = each.value.ttl
  proxied = each.value.proxied
  comment = each.value.comment
}