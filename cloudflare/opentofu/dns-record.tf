module "infra_dns_record" {
  source = "github.com/terminalbaka/terraform-modules//modules/cloudflare/dns-record?ref=v1.0.2"
  for_each = local.domain-records
  zone_id = each.value.zone_id
  name = each.value.name
  content = each.value.content
  type = each.value.type
  ttl = each.value.ttl
  proxied = each.value.proxied
  comment = each.value.comment
}
