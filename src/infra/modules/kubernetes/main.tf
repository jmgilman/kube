module "this" {
  # v19.4.2
  source = "github.com/terraform-aws-modules/terraform-aws-eks?ref=1f1cb3a5d7ba5e9b771fb70ed5ef251a9d12aa70"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  cluster_addons = {
    coredns    = {}
    kube-proxy = {}
    vpc-cni = {
      most_recent = true
      configuration_values = jsonencode({
        env = {
          # See: https://docs.aws.amazon.com/eks/latest/userguide/cni-increase-ip-addresses.html
          ENABLE_PREFIX_DELEGATION = "true"
          WARM_PREFIX_TARGET       = "1"
        }
      })
    }
  }

  cluster_endpoint_public_access = true

  vpc_id     = var.vpc_id
  subnet_ids = var.subnet_ids

  eks_managed_node_groups = {
    default = {
      use_custom_launch_template = false

      instance_types = var.instance_types
      capacity_type  = var.instance_capacity_type

      disk_size = var.node_disk_size

      min_size     = var.cluster_min_size
      max_size     = var.cluser_max_size
      desired_size = var.cluster_desired_size
    }
  }

  tags = var.label.tags
}
