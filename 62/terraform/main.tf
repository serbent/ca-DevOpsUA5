module "eks" {
    source  = "terraform-aws-modules/eks/aws"
    version = "21.3.1"

    name = "ca-devopsua5"
    addons = {
    coredns                = {}
    eks-pod-identity-agent = {}
    kube-proxy             = {}
    vpc-cni                = {}
    metrics-server         = {}
  }

    vpc_id     = module.vpc.vpc_id
    subnet_ids = module.vpc.private_subnets
    fargate_profiles= {
      default = {
        name = "default"
        selectors = [
          {
            namespace = "default"
          }
        ]
      },
      aws-observability = {
        name = "aws-observability"
        selectors = [
          {
            namespace = "aws-observability"
          }
        ]
      }
    }
    eks_managed_node_groups = {
    system = {
      instance_types = ["t3.medium"]
      desired_size   = 2
      min_size       = 1
      max_size       = 3

      # Label nodes so you know they’re system nodes
      labels = {
        role = "system"
      }
      # Launch template override for metadata options
      launch_template_id      = aws_launch_template.system.id
      launch_template_version = "$Latest"


    }
  }
    endpoint_public_access = true
    enable_cluster_creator_admin_permissions = true

    
}



data "aws_availability_zones" "available" {
  # Exclude local zones
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}

locals {
  name   = "ca-devopsua5"
  region = "eu-central-1"

  vpc_cidr = "10.0.0.0/16"
  azs      = slice(data.aws_availability_zones.available.names, 0, 3)

  tags = {
    Example    = local.name
    GithubRepo = "terraform-aws-eks"
    GithubOrg  = "terraform-aws-modules"
  }
}

################################################################################
# VPC
################################################################################

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.0.1"

  name = local.name
  cidr = local.vpc_cidr

  azs             = local.azs
  private_subnets = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 4, k)]
  public_subnets  = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 8, k + 48)]
  intra_subnets   = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 8, k + 52)]

  enable_nat_gateway = true
  single_nat_gateway = true

  public_subnet_tags = {
    "kubernetes.io/role/elb" = 1
  }

  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = 1
  }

  tags = local.tags
}


resource "aws_launch_template" "system" {
  name_prefix   = "system-node-"
  image_id      = data.aws_ami.eks_worker.id
  instance_type = "t3.medium"

  metadata_options {
    http_tokens                 = "required"
    http_put_response_hop_limit = 5
    http_endpoint               = "enabled"
  }

  # IAM role for nodes
  iam_instance_profile {
    name = aws_iam_instance_profile.system.name
  }
}
