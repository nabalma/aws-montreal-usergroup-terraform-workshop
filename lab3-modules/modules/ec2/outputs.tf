output "instance_id" {
  description = "ID of the created EC2 instance"
  value       = aws_instance.main.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.main.public_ip
}

output "security_group_id" {
  description = "ID of the security group"
  value       = aws_security_group.allow_ssh.id
}

output "key_pair_name" {
  description = "Name of the created key pair"
  value       = aws_key_pair.main.key_name
} 