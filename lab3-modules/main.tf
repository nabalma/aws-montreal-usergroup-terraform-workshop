# Configure AWS Provider
provider "aws" {
  region = "us-west-2"
}

# VPC Module
module "vpc" {
  source = "./modules/vpc"

  environment       = var.environment
  vpc_cidr         = var.vpc_cidr
  subnet_cidr      = var.subnet_cidr
  availability_zone = var.availability_zone
}

# EC2 Module
module "ec2" {
  source = "./modules/ec2"

  environment     = var.environment
  vpc_id         = module.vpc.vpc_id
  subnet_id      = module.vpc.subnet_id
  ami_id         = var.ami_id
  instance_type  = var.instance_type
  public_key_path = var.public_key_path
} 