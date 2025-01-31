locals {
  aws-remote-infra = data.terraform_remote_state.infra-aws.outputs
  domain-records = {
    cname_aws_certificate_manager = {
      zone_id = var.zoneIdTerminalbaka
      name = "_b4e24312520084668b28d6851a1d5e1d.terminalbaka.com.br."
      content = "_ddb3fe234413dad726c1a492ca536690.zfyfvmchrl.acm-validations.aws."
      type = "CNAME"
      ttl = 60
      proxied = false
      comment = "AWS - Certificate Manager"
    }
    txt_github_pages_terminalbaka = {
      zone_id = var.zoneIdTerminalbaka
      name = "_github-pages-challenge-terminalbaka.site"
      content = "\"cd5e254f847943a3410bf75809eafd\""
      type = "TXT"
      ttl = 1
      proxied = false
      comment = "GitHub Pages - Terminalbaka"
    }
    cname_github_pages_terminalbaka = {
      zone_id = var.zoneIdTerminalbaka
      name = "site"
      content = "terminalbaka.github.io"
      type = "CNAME"
      ttl = 1
      proxied = false
      comment = "GitHub Pages - Terminalbaka"
    }
  }
}
