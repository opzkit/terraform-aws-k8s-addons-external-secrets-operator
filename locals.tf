locals {
  version               = "0.18.2"
  external_secrets_yaml = file("${path.module}/external-secrets.yaml")
  external_secrets_store_yaml = templatefile("${path.module}/cluster-secret-store.yaml", {
    region = var.region
  })
}
