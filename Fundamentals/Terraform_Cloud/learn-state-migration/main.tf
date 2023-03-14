# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

## Terraform configuration

terraform {

  cloud {
    hostname     = "app.terraform.io"
    organization = "example-org-0dd834"

    workspaces {
      name = "learn-terraform-cloud-migrate"
    }
  }

  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.3.2"
    }
  }
  required_version = ">= 1.1.0"
}

variable "name_length" {
  description = "Test new description"
  default     = "5"
}

resource "random_pet" "pet_name" {
  length    = var.name_length
  separator = "_"
}

output "pet_name" {
  value = random_pet.pet_name.id
}
