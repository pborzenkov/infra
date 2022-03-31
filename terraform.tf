terraform {
  backend "pg" {}
}

terraform {
  required_providers {
    namecheap = {
      source  = "namecheap/namecheap"
      version = "~> 2.1"
    }
  }
}

provider "namecheap" {
  user_name = "pborzenkov"
  api_user  = "pborzenkov"
}
