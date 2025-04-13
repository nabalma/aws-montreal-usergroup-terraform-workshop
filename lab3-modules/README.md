# Lab 3: Terraform Modules

This lab demonstrates how to use Terraform modules to create reusable infrastructure components. The project creates a VPC with a public subnet and launches an EC2 instance within it.

## Project Structure

```
lab3-modules/
├── main.tf           # Root configuration file
├── variables.tf      # Root variables
├── outputs.tf        # Root outputs
├── modules/
│   ├── vpc/         # VPC Module
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── ec2/         # EC2 Module
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
```

## Module Description

### VPC Module (`./modules/vpc`)
Creates the networking infrastructure including:
- VPC
- Public Subnet
- Internet Gateway
- Route Table

### EC2 Module (`./modules/ec2`)
Creates the compute infrastructure including:
- EC2 Instance
- Security Group (allowing SSH access)
- SSH Key Pair

## Variables

### Root Level Variables
- `environment`: Environment name for resource tagging (default: "dev")
- `vpc_cidr`: CIDR block for VPC (default: "10.0.0.0/16")
- `subnet_cidr`: CIDR block for subnet (default: "10.0.1.0/24")
- `availability_zone`: AZ for the subnet (default: "us-east-1a")
- `ami_id`: AMI ID for EC2 instance (default: Amazon Linux 2023 in us-east-1)
- `instance_type`: EC2 instance type (default: "t2.micro")
- `public_key_path`: Path to your SSH public key (default: "./ssh_key.pub")

## Outputs

The configuration exposes several useful outputs:
- `vpc_id`: ID of the created VPC
- `subnet_id`: ID of the created subnet
- `instance_id`: ID of the EC2 instance
- `instance_public_ip`: Public IP of the EC2 instance
- `security_group_id`: ID of the created security group

## Usage
1. Navigate to the lab directory:
   ```bash
   cd lab3-modules
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

## Customization

You can customize the deployment by:

1. Creating a `terraform.tfvars` file:
```hcl
environment     = "staging"
vpc_cidr        = "172.16.0.0/16"
subnet_cidr     = "172.16.1.0/24"
instance_type   = "t2.small"
public_key_path = "/path/to/your/key.pub"
```

2. Or by using command line variables:
```bash
terraform apply -var="environment=prod" -var="instance_type=t2.small"
```

## Module Dependencies

The EC2 module depends on the VPC module for:
- VPC ID for security group creation
- Subnet ID for instance placement

These dependencies are automatically handled by Terraform through the use of module outputs. 