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
- `availability_zone`: AZ for the subnet (default: "us-west-2a")
- `ami_id`: AMI ID for EC2 instance (default: Amazon Linux 2 in us-west-2)
- `instance_type`: EC2 instance type (default: "t2.micro")
- `public_key_path`: Path to your SSH public key (default: "~/.ssh/id_rsa.pub")

## Outputs

The configuration exposes several useful outputs:
- `vpc_id`: ID of the created VPC
- `subnet_id`: ID of the created subnet
- `instance_id`: ID of the EC2 instance
- `instance_public_ip`: Public IP of the EC2 instance
- `security_group_id`: ID of the created security group

## Usage

1. Initialize Terraform:
```bash
terraform init
```

2. Review the changes:
```bash
terraform plan
```

3. Apply the configuration:
```bash
terraform apply
```

4. To destroy the infrastructure:
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