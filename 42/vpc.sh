# A script to create a VPC with public and private subnets, an internet gateway, and a NAT gateway.
#!/bin/bash

# variables
VPC_CIDR="10.0.0.0/16"
PUBLIC_SUBNET_CIDR="10.0.0.0/24"
PRIVATE_SUBNET_CIDR="10.0.1.0/24"

AWS_VPC=$(aws ec2 create-vpc --cidr-block $VPC_CIDR  --query 'Vpc.{VpcId:VpcId}' --output text)

aws ec2 create-tags --resources $AWS_VPC --tags Key=Name,Value=DevOpsVPC

echo "VPC created with ID: $AWS_VPC"

# echo $AWS_VPC

AWS_PUBLIC_SUBNET=$(aws ec2 create-subnet --vpc-id $AWS_VPC --cidr-block $PUBLIC_SUBNET_CIDR --availability-zone eu-central-1a --query 'Subnet.{SubnetId:SubnetId}' --output text)

echo "Public subnet created with ID: $AWS_PUBLIC_SUBNET"

aws ec2 create-tags --resources $AWS_PUBLIC_SUBNET --tags Key=Name,Value=PublicSubnet

AWS_PRIVATE_SUBNET=$(aws ec2 create-subnet --vpc-id $AWS_VPC --cidr-block $PRIVATE_SUBNET_CIDR --availability-zone eu-central-1a --query 'Subnet.{SubnetId:SubnetId}' --output text)

echo "Private subnet created with ID: $AWS_PRIVATE_SUBNET"

aws ec2 create-tags --resources $AWS_PRIVATE_SUBNET --tags Key=Name,Value=PrivateSubnet