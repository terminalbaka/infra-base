locals {
  aws-remote-infra = data.terraform_remote_state.infra-aws.outputs
  domain-records = {
    # CNAME records
    cname_aws_certificate_manager = { zone_id = var.zoneIdTerminalbaka, name = "_b4e24312520084668b28d6851a1d5e1d.terminalbaka.com.br.", content = "_ddb3fe234413dad726c1a492ca536690.zfyfvmchrl.acm-validations.aws.", type = "CNAME", ttl = 60, proxied = false, comment = "AWS - Certificate Manager" }
    cname_github_pages_terminalbaka = { zone_id = var.zoneIdTerminalbaka, name = "site", content = "terminalbaka.github.io", type = "CNAME", ttl = 1, proxied = false, comment = "GitHub Pages - Terminalbaka" }

    # TXT records
    txt_spf_terminalbaka = { zone_id = var.zoneIdTerminalbaka, name = "@", content = "\"v=spf1 include:zohomail.com ~all\"", type = "TXT", ttl = 1, proxied = false, comment = "SPF - Terminalbaka" }
    txt_github_pages_terminalbaka = { zone_id = var.zoneIdTerminalbaka, name = "_github-pages-challenge-terminalbaka.site", content = "\"cd5e254f847943a3410bf75809eafd\"", type = "TXT", ttl = 1, proxied = false, comment = "GitHub Pages - Terminalbaka" }
    txt_zoho_mail_terminalbaka = { zone_id = var.zoneIdTerminalbaka, name = "@", content = "\"zoho-verification=zb95611783.zmverify.zoho.com\"", type = "TXT", ttl = 1, proxied = false, comment = "Zoho mail - Terminalbaka" }
    txt_zoho_mail_dkim_terminalbaka = { zone_id = var.zoneIdTerminalbaka, name = "zmail._domainkey", content = "\"v=DKIM1; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCke0xVIEZ36LTwSuzz97ZRapFoeoiGDm3EB8er6Ivw+GxGCEvfrZOfLgFh1mxVs+t76nypJnbjjlCA0LxZNi8OqdLogkupa3O/rrJwYyNQhaWLzkwmp2D8u4FG06VELPfJDlvJZrh6MTgrE91rmEwUSulV8e2Kt9roWmrVn/PSsQIDAQAB\"", type = "TXT", ttl = 1, proxied = false, comment = "Zoho mail dkim - Terminalbaka" }

    # MX
    mx01_zoho_mail_terminalbaka = { zone_id = var.zoneIdTerminalbaka, name = "@", content = "mx.zoho.com", type = "MX", ttl = 1, proxied = false, comment = "Zoho mail mx 01 - Terminalbaka", priority = 10}
    mx02_zoho_mail_terminalbaka = { zone_id = var.zoneIdTerminalbaka, name = "@", content = "mx2.zoho.com", type = "MX", ttl = 1, proxied = false, comment = "Zoho mail mx 02 - Terminalbaka", priority = 20}
    mx03_zoho_mail_terminalbaka = { zone_id = var.zoneIdTerminalbaka, name = "@", content = "mx3.zoho.com", type = "MX", ttl = 1, proxied = false, comment = "Zoho mail mx 03 - Terminalbaka", priority = 50}
  }
}
