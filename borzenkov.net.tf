resource "namecheap_domain_records" "borzenkov_net" {
  domain     = "borzenkov.net"
  mode       = "OVERWRITE"
  email_type = "MX"

  // Address of the VPS
  record {
    hostname = "@"
    type     = "A"
    address  = vultr_instance.gw.main_ip
  }

  // Email
  record {
    hostname = "@"
    type     = "MX"
    address  = "in1-smtp.messagingengine.com."
    mx_pref  = 10
  }
  record {
    hostname = "@"
    type     = "MX"
    address  = "in2-smtp.messagingengine.com."
    mx_pref  = 20
  }
  record {
    hostname = "fm1._domainkey"
    type     = "CNAME"
    address  = "fm1.borzenkov.net.dkim.fmhosted.com."
  }
  record {
    hostname = "fm2._domainkey"
    type     = "CNAME"
    address  = "fm2.borzenkov.net.dkim.fmhosted.com."
  }
  record {
    hostname = "fm3._domainkey"
    type     = "CNAME"
    address  = "fm3.borzenkov.net.dkim.fmhosted.com."
  }
  record {
    hostname = "@"
    type     = "TXT"
    address  = "v=spf1 include:spf.messagingengine.com ?all"
  }

  // Publicly available services from the lab
  record {
    hostname = "photos"
    type     = "CNAME"
    address  = "borzenkov.net."
  }
  record {
    hostname = "wallabag"
    type     = "CNAME"
    address  = "borzenkov.net."
  }
}
