variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
  default     = "miniman-eks-fargate"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_subnets_cidrs" {
  type = list(string)
  default = ["10.0.0.0/24", "10.0.1.0/24"]
}

variable "availability_zones" {
  type = list(string)
  default = ["us-east-1a", "us-east-1b"]
}

variable "private_subnets_cidrs" {
  type = list(string)
  default = ["10.0.100.0/24", "10.0.101.0/24"]
}
