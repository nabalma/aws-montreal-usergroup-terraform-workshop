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
1. Navigate to the lab directory:
   ```bash
   cd lab1-ec2-ssh
   ```

2. Generate SSH Key Pair:

   ### For Linux/macOS:
   ```bash
   ssh-keygen -t rsa -b 2048 -f ssh_key -N ""
   chmod 400 ssh_key
   ```

   ### For Windows (PowerShell):
   ```powershell
   # Option 1: Using ssh-keygen (Windows 10 build 1809 and later)
   # Generate the SSH key
   ssh-keygen -t rsa -b 2048 -f ssh_key -N '""'
   
   # Remove inheritance and set proper permissions
   icacls ssh_key /inheritance:r
   icacls ssh_key /grant:r $env:USERNAME`:R

   # Option 2: Using PuTTYgen
   # 1. Download PuTTYgen from: https://www.puttygen.com/
   # 2. Open PuTTYgen
   # 3. Set "Type of key to generate" to "RSA"
   # 4. Set "Number of bits in a generated key" to "2048"
   # 5. Click "Generate"
   # 6. Save the private key as "ssh_key"
   # 7. Save the public key as "ssh_key.pub"
   ```

3. Initialize Terraform:
```bash
terraform init
```

4. Generate and review an execution plan:
```bash
terraform plan
```

5. Apply the configuration:
```bash
terraform apply
```

6. Once created, you can SSH into your instance:
```bash
ssh -i ./ssh_key ec2-user@<instance_public_ip>
```

7. To destroy the infrastructure:
```bash
terraform destroy
```

## Important Notes

- Make sure you have your AWS credentials configured
- The default region is set to us-east-1 (Northern Virginia)
- Remember to destroy resources when you're done to avoid unnecessary charges (by running the command terraform destory)
- The SSH key pair uploaded to the instance is the generated SSH public key (./ssh_key.pub)

## Next Steps

After completing this lab, proceed to [Lab 2](../lab2-ec2-variables/README.md) to learn about variables and outputs in Terraform. 