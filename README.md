# terraform-aws-k8s-addons-external-secrets-operator

A terraform module which provides
the [IRSA external permissions](https://kops.sigs.k8s.io/cluster_spec/#service-account-issuer-discovery-and-aws-iam-roles-for-service-accounts-irsa)
and the [custom addon](https://kops.sigs.k8s.io/addons/#custom-addons)
for [external-secrets](https://github.com/external-secrets/external-secrets) to be used together
with [opzkit/k8s/aws](https://registry.terraform.io/modules/opzkit/k8s/aws/latest).

## How to update the module to a new version of the operator
Start by adding/updating the charts
```shell
helm repo add external-secrets https://charts.external-secrets.io
helm repo update external-secrets
```

Then template the chart to file
```shell
helm template external-secrets external-secrets/external-secrets -n kube-system --values values.yaml >| external-secrets.yaml
```

Check the changes and if everything looks correct, commit, push and PR.

## Releasing
Make sure to update the `version` for the `external-secrets` addon to match the planned tag/release version before
tagging the commit.

```terraform

output "addons" {
  value = [
    {
      name : "external-secrets"
      version : "0.6.0"
      content : local.external_secrets_yaml
    },
  ]
}
```
