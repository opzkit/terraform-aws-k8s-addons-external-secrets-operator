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
    name : "kubernetes-external-secrets"
    version : "8.3.0"
    content : local.kubernetes_external_secrets_yaml
  }
}
