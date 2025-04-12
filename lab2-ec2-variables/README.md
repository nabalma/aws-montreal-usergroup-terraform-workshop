# Lab 1: Basic EC2 Instance with Terraform

This lab demonstrates how to create a basic EC2 instance using Terraform with SSH access.

## Architecture Overview

This lab will create:
- A VPC (CIDR: 10.0.0.0/16)
- A public subnet (CIDR: 10.0.1.0/24)
- An Internet Gateway
- A Route Table for internet access
- A Security Group allowing SSH access (port 22)
- An EC2 instance (Amazon Linux 2023) with a public IP
- An SSH key pair for secure access

## Prerequisites

1. AWS CLI installed and configured
2. Terraform installed
3. Basic understanding of AWS and Terraform concepts

## File Structure
```
lab1-ec2-ssh/
├── main.tf         # Main Terraform configuration
└── README.md       # This documentation file
```

## Deployment Steps

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

4. Review the planned changes:
   ```bash
   terraform plan
   ```

5. Apply the configuration:
   ```bash
   terraform apply
   ```
   Type 'yes' when prompted.

6. After successful deployment, you'll see the public IP address in the output.

## Connecting to the EC2 Instance

1. Use the SSH command with the generated key:

   ```bash
   ssh -i ssh_key ec2-user@<PUBLIC_IP>
   ```
   Replace `<PUBLIC_IP>` with the IP address shown in the Terraform output.

2. If you see a "Permission denied" error, ensure:
   - The key file has correct permissions (400)
   - You're using the correct username (ec2-user)
   - The instance has finished initializing (wait 1-2 minutes)

## Clean Up

To destroy all resources created:
```bash
terraform destroy
```
Type 'yes' when prompted.

## Architecture Diagram

```
                                    AWS Cloud
┌──────────────────────────────────────────────────────────┐
│                                                          │
│   VPC (10.0.0.0/16)                                     │
│   ┌────────────────────────────────────────────┐        │
│   │                                            │        │
│   │   Public Subnet (10.0.1.0/24)             │        │
│   │   ┌─────────────────┐                      │        │
│   │   │                 │                      │        │
│   │   │  EC2 Instance   │ ◄──── SSH Access    │        │
│   │   │  (t2.micro)     │        (Port 22)     │        │
│   │   └────────┬────────┘                      │        │
│   │            │                               │        │
│   │            ▼                               │        │
│   │     Internet Gateway                       │        │
│   │                                            │        │
│   └────────────────────────────────────────────┘        │
│                                                          │
└──────────────────────────────────────────────────────────┘
```

## Resource Details

1. **VPC**
   - CIDR: 10.0.0.0/16
   - DNS hostnames enabled
   - DNS support enabled

2. **Public Subnet**
   - CIDR: 10.0.1.0/24
   - Auto-assign public IPs enabled
   - Availability Zone: us-east-1a

3. **Security Group**
   - Inbound: Allow SSH (port 22) from anywhere
   - Outbound: Allow all traffic

4. **EC2 Instance**
   - AMI: Amazon Linux 2023
   - Type: t2.micro
   - Public IP: Automatically assigned
   - Root volume: 8GB gp2

## Important Notes

1. Security Considerations:
   - The security group allows SSH access from any IP (0.0.0.0/0)
   - For production, restrict SSH access to specific IP ranges
   - Keep your private key (ssh_key) secure and never commit it to version control

2. Costs:
   - This lab creates resources that may incur AWS charges
   - Remember to run `terraform destroy` when done
   - The t2.micro instance is free-tier eligible 