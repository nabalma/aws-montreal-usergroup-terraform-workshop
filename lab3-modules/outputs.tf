# VPC Outputs
output "vpc_id" {
  description = "ID of the created VPC"
  value       = module.vpc.vpc_id
}

output "subnet_id" {
  description = "ID of the created subnet"
  value       = module.vpc.subnet_id
}

# EC2 Outputs
output "instance_id" {
  description = "ID of the created EC2 instance"
  value       = module.ec2.instance_id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = module.ec2.instance_public_ip
}

output "security_group_id" {
  description = "ID of the security group"
  value       = module.ec2.security_group_id
} 