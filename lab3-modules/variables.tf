variable "environment" {
  description = "Environment name for tagging and naming resources"
  type        = string
  default     = "dev"
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
  default     = "us-west-2a"
}

variable "ami_id" {
  description = "ID of the AMI to use for the EC2 instance"
  type        = string
  default     = "ami-0735c191cf914754d"  # Amazon Linux 2 in us-west-2
}

variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "public_key_path" {
  description = "Path to the public key file for SSH access"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
} 