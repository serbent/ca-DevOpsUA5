Minimal EKS on Fargate Terraform

What this creates
- VPC with two public subnets
- Internet Gateway and route table
- Security Group allowing HTTPS ingress to EKS API (0.0.0.0/0)
- IAM roles for EKS cluster and Fargate pod execution
- EKS cluster with public endpoint enabled
- Fargate profile for the default namespace

Quick start
1. Install Terraform 1.x and AWS CLI.
2. Configure AWS credentials (env or profile).
3. terraform init
4. terraform apply

Notes
- This is minimal and opts for public EKS endpoint and public subnets so both API and pods can reach the internet.
- For production, tighten security group CIDRs, use private subnets and NAT, and configure IAM and OIDC properly.
