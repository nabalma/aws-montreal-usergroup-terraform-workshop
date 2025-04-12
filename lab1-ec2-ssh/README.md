# Lab 1: Basic EC2 Instance with SSH Access

This lab introduces the basics of Terraform by creating a simple EC2 instance that you can access via SSH.

## What You'll Learn

- Basic Terraform configuration structure
- How to configure the AWS provider
- How to create an EC2 instance
- How to create and configure security groups
- How to manage SSH keys in AWS

## Resources Created

1. EC2 instance (t2.micro) running Amazon Linux 2
2. Security group allowing SSH access (port 22)
3. SSH key pair for secure instance access

## Files

- `main.tf`: Contains all the resource definitions

## Usage

1. Initialize Terraform:
```bash
terraform init
```

2. Generate and review an execution plan:
```bash
terraform plan
```

3. Apply the configuration:
```bash
terraform apply
```

4. Once created, you can SSH into your instance:
```bash
ssh -i ~/.ssh/id_rsa ec2-user@<instance_public_ip>
```

5. To destroy the infrastructure:
```bash
terraform destroy
```

## Important Notes

- Make sure you have your AWS credentials configured
- The default region is set to us-west-2 (Oregon)
- Remember to destroy resources when you're done to avoid unnecessary charges
- The SSH key pair uses your default SSH public key (~/.ssh/id_rsa.pub)

## Next Steps

After completing this lab, proceed to [Lab 2](../lab2-ec2-variables/README.md) to learn about variables and outputs in Terraform. 