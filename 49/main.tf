module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "6.0.1"

  name = "my-vpc-ua5-49"
  cidr = "10.0.0.0/16"

  azs             = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}

module "vm" {
    source = "./modules/vm"
    subnet_id = module.vpc.public_subnets[0]
    vpc_security_group_id = module.vpc.default_security_group_id
    instance_type = "t2.micro"
    count = 1
    ami = "ami-02003f9f0fde924ea" # Example AMI, replace with a valid one for your region
}

module "ec2_instance" {
  source = "git::https://github.com/terraform-aws-modules/terraform-aws-ec2-instance.git?ref=v6.0.2"
#   version = "6.0.2"

  name = "my-ec2-instance-ua5-49"
  ami = "ami-02003f9f0fde924ea" # Example AMI, replace with a valid one for your region
  instance_type = "t2.micro"

  vpc_security_group_ids = [module.vpc.default_security_group_id]
  subnet_id = module.vpc.public_subnets[0]

  tags = {
    Name = "MyEC2InstanceUA5-49"
    Environment = "dev"
  }
}