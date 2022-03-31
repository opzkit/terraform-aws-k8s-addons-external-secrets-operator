locals {
  external_secrets_yaml = templatefile("${path.module}/external-secrets.yaml", {
    name       = var.name
    region     = var.region
    account_id = var.account_id
  })
}
