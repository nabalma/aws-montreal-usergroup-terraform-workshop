variable "environment" {
  description = "Environment name for tagging and naming resources"
  type        = string
  default     = "terraform-lab3-dev"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "CIDR block for subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "availability_zone" {
  description = "Availability zone for the subnet"
  type        = string
  default     = "us-east-1a"
}

variable "ami_id" {
  description = "ID of the AMI to use for the EC2 instance"
  type        = string
  default     = "ami-00a929b66ed6e0de6"  # Amazon Linux 2023
}

variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "public_key_path" {
  description = "Path to the public key file for SSH access"
  type        = string
  default     = "./ssh_key.pub"
} 