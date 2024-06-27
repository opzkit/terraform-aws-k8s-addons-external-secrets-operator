output "permissions" {
  value = {
    name      = "external-secrets"
    namespace = "kube-system"
    aws = {
      inline_policy = <<EOT
    [
      {
        "Effect": "Allow",
        "Action": [
          "secretsmanager:GetRandomPassword",
          "secretsmanager:GetResourcePolicy",
          "secretsmanager:GetSecretValue",
          "secretsmanager:DescribeSecret",
          "secretsmanager:ListSecretVersionIds",
          "secretsmanager:ListSecrets"
        ],
        "Resource": "*"
      }
    ]
    EOT
    }
  }
}

output "addons" {
  value = [
    {
      name : "external-secrets"
      version : local.version
      content : local.external_secrets_yaml
    },
    {
      name : "external-secrets-store"
      version : "0.0.1"
      content : local.external_secrets_store_yaml
    },
  ]
}
