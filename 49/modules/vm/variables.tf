variable "instance_name" {
  description = "Name of the instance"
  type        = string
  default     = "devops-ua5-instance"
}

  variable "ami" {  
    description = "AMI ID for the instance"
    type        = string
    default     = "ami-02003f9f0fde924ea" # Example AMI ID, replace with a valid one
  }           
 
 variable "instance_type" {
  description = "Type of the instance"
  type        = string
  default     = "t2.micro"
 }

 variable "vpc_security_group_id" {
  description = "VPC security group ID to apply to the instance"
  type        = string
  default     = ""
 }

variable "subnet_id" {
  description = "Subnet ID where the instance will be created"
  type        = string
  default     = ""
}