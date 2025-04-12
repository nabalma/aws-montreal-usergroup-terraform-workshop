# Terraform Workshop - AWS Montreal User Group

This repository contains the workshop materials for the AWS Montreal User Group's Terraform Workshop. The workshop is designed to help you learn Infrastructure as Code (IaC) using Terraform with AWS.

## Workshop Structure

The workshop is divided into multiple labs, each focusing on different aspects of Terraform:

### Lab 1: Basic EC2 Instance with SSH Access
Learn the basics of Terraform by creating:
- A simple EC2 instance
- Security group for SSH access
- SSH key pair for secure access
- Basic AWS provider configuration

[Go to Lab 1 Documentation](./lab1-ec2-ssh/README.md) | [View Configuration](./lab1-ec2-ssh/main.tf)

### Lab 2: EC2 with Variables and Outputs
Learn how to make your Terraform code more flexible using:
- Input variables
- Variable types and validation
- Output values
- Local values
- Data sources

[Go to Lab 2 Documentation](./lab2-ec2-variables/README.md)

### Lab 3: Terraform Modules
Learn how to create and use Terraform modules to make your infrastructure code reusable and maintainable. This lab includes:
- Creating a VPC module
- Creating an EC2 module
- Using modules together to create a complete infrastructure
- Managing module inputs and outputs
- Understanding module dependencies

[Go to Lab 3 Documentation](./lab3-modules/README.md)

## Prerequisites

Before starting the workshop, ensure you have:

1. **AWS Account**: An AWS account with appropriate permissions
2. **AWS CLI**: Installed and configured with your credentials
3. **Terraform**: Version 1.0.0 or later installed
4. **Git**: For cloning this repository
5. **Text Editor**: VSCode, Sublime, or any preferred editor

## Getting Started

1. Clone this repository:
```bash
git clone https://github.com/YOUR_USERNAME/terraform-workshop.git
cd terraform-workshop
```

2. Navigate to the desired lab directory:
```bash
cd lab3-modules
```

3. Follow the instructions in each lab's README.md file.

## Best Practices Covered

- Modular infrastructure design
- Code reusability
- Infrastructure testing
- Resource naming and tagging
- State management
- Variable management
- Output handling

## Contributing

Feel free to submit issues and enhancement requests!

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

Special thanks to the AWS Montreal User Group community for their support and participation! 