terraform {
  cloud {
    organization = "jars-universe"

    workspaces {
      name = "test-workspace"
    }
  }
}
