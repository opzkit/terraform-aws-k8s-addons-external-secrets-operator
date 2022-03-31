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

output "addon" {
  value = {
    name : "external-secrets"
    version : "0.4.4"
    content : local.external_secrets_yaml
  }
}
