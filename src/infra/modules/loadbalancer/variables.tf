variable "cluster_name" {
  type        = string
  description = "Name of the EKS cluster"
}

variable "cluster_region" {
  type        = string
  description = "The region the cluster is located in"
}

variable "oidc_provider_arn" {
  type        = string
  description = "The ARN of the cluster OIDC provider"
}

variable "iam_role_name" {
  type        = string
  description = "The name to use for generated IAM role"
  default     = "load-balancer-controller"
}

variable "service_account_name" {
  type        = string
  description = "The name to use for the AWS Load Balancer Controller service account"
  default     = "aws-load-balancer-controller"
}

variable "label" {
  type = object({
    namespace   = optional(string)
    environment = optional(string)
    stage       = optional(string)
    name        = optional(string)
    attributes  = optional(list(string))
    delimiter   = optional(string)
    tags        = optional(map(string))
  })
  description = "The label to use for this module"
}
