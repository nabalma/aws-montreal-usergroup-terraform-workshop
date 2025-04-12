# Lab 2: EC2 with Variables and Outputs

This lab demonstrates how to create an EC2 instance using Terraform with variables for better configuration management and reusability.

## Architecture Overview

This lab will create:
- A VPC with configurable CIDR (default: 10.0.0.0/16)
- A public subnet with configurable CIDR (default: 10.0.1.0/24)
- An Internet Gateway
- A Route Table for internet access
- A Security Group allowing SSH access (port 22)
- An EC2 instance (Amazon Linux 2023) with configurable instance type
- An SSH key pair for secure access

## Prerequisites

1. AWS CLI installed and configured
2. Terraform installed
3. Basic understanding of AWS and Terraform concepts

## File Structure
```
lab2-ec2-variables/
├── main.tf         # Main Terraform configuration
├── variables.tf    # Variable definitions
├── outputs.tf      # Output definitions
└── README.md       # This documentation file
```

## Deployment Steps

1. Navigate to the lab directory:
   ```bash
   cd lab2-ec2-variables
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

3. (Optional) Create terraform.tfvars file to customize your deployment:
   ```hcl
   aws_region = "us-east-1"
   instance_type = "t2.micro"
   vpc_cidr = "10.0.0.0/16"
   subnet_cidr = "10.0.1.0/24"
   availability_zone = "us-east-1a"
   instance_name = "my-ec2-instance"
   ```

4. Initialize Terraform:
   ```bash
   terraform init
   ```

5. Review the planned changes:
   ```bash
   terraform plan
   ```

6. Apply the configuration:
   ```bash
   terraform apply
   ```
   Type 'yes' when prompted.

7. After successful deployment, you'll see the outputs including:
   - VPC ID
   - Subnet ID
   - Instance ID
   - Public IP address
   - Public DNS name

## Connecting to the EC2 Instance

1. Use the SSH command with the generated key:

   Using Public IP (from outputs):
   ```bash
   ssh -i ssh_key ec2-user@<PUBLIC_IP>
   ```

   Using Public DNS (from outputs):
   ```bash
   ssh -i ssh_key ec2-user@<PUBLIC_DNS>
   ```

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
│   VPC (Configurable CIDR)                               │
│   ┌────────────────────────────────────────────┐        │
│   │                                            │        │
│   │   Public Subnet (Configurable CIDR)        │        │
│   │   ┌─────────────────┐                      │        │
│   │   │                 │                      │        │
│   │   │  EC2 Instance   │ ◄──── SSH Access    │        │
│   │   │(Variable Type)  │        (Port 22)     │        │
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
   - CIDR: Configurable (default: 10.0.0.0/16)
   - DNS hostnames enabled
   - DNS support enabled

2. **Public Subnet**
   - CIDR: Configurable (default: 10.0.1.0/24)
   - Auto-assign public IPs enabled
   - Configurable availability zone

3. **Security Group**
   - Inbound: Allow SSH (port 22) from anywhere
   - Outbound: Allow all traffic

4. **EC2 Instance**
   - AMI: Amazon Linux 2023
   - Type: Configurable (default: t2.micro)
   - Public IP: Automatically assigned
   - Root volume: 8GB gp2

## Available Variables

| Variable Name | Description | Default Value |
|--------------|-------------|---------------|
| aws_region | AWS region | us-east-1 |
| instance_type | EC2 instance type | t2.micro |
| vpc_cidr | VPC CIDR block | 10.0.0.0/16 |
| subnet_cidr | Subnet CIDR block | 10.0.1.0/24 |
| availability_zone | AZ for the subnet | us-east-1a |
| instance_name | Name tag for EC2 | terraform-lab2-instance |

## Important Notes

1. Security Considerations:
   - The security group allows SSH access from any IP (0.0.0.0/0)
   - For production, restrict SSH access to specific IP ranges
   - Keep your private key (ssh_key) secure and never commit it to version control

2. Costs:
   - This lab creates resources that may incur AWS charges
   - Remember to run `terraform destroy` when done
   - The t2.micro instance is free-tier eligible

3. Variable Customization:
   - Use terraform.tfvars for persistent variable values
   - Use -var flag for one-time variable changes (e.g., `terraform apply -var="instance_type=t3.micro"`)
   - Use environment variables (TF_VAR_variable_name) for sensitive data 