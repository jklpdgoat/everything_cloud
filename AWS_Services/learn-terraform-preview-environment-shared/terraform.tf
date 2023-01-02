terraform {
  cloud {
    hostname     = "app.terraform.io"
    organization = "hashicorp-training-jklp"
    workspaces {
      name = "hcup-be-shared"
    }
  }

  required_providers {
    vercel = {
      source  = "vercel/vercel"
      version = "0.3.0"
    }
  }
}
