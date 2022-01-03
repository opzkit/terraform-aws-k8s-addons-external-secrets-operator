variable "name" {
  type        = string
  description = "Name of the K8S cluster where the addon will be applied"
}

variable "region" {
  type        = string
  description = "The AWS region where the K8S cluster is running"
}

variable "account_id" {
  type        = string
  description = "The AWS account id which owns the secrets"
}
