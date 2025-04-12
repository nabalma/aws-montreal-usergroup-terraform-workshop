# Local Environment Setup Guide

## 1. Install AWS CLI

### For Windows:
1. Download the AWS CLI MSI installer:
   - Visit: https://awscli.amazonaws.com/AWSCLIV2.msi
   - Or use this command in PowerShell:
   ```powershell
   msiexec.exe /i https://awscli.amazonaws.com/AWSCLIV2.msi
   ```
2. Follow the installation wizard
3. Verify installation:
   ```bash
   aws --version
   ```

### For macOS:
1. Download the AWS CLI pkg installer:
   ```bash
   curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
   ```
2. Run the installer:
   ```bash
   sudo installer -pkg AWSCLIV2.pkg -target /
   ```
3. Verify installation:
   ```bash
   aws --version
   ```

### For Linux (Ubuntu/Debian):
```bash
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo apt-get install unzip
unzip awscliv2.zip
sudo ./aws/install
```

## 2. Install Terraform

Visit the official Terraform installation guide and follow the instructions for your operating system:
[Terraform Installation Guide](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

Choose your installation method based on your OS:
- **Linux**: Follow the package manager instructions for your distribution (apt, yum, dnf)
- **macOS**: Use Homebrew package manager
- **Windows**: Use Chocolatey package manager or manual installation
- **Manual installation**: Download the binary directly from HashiCorp

After installation, verify Terraform is installed correctly:
```bash
terraform --version
```

## 3. Configure AWS CLI

1. Create an AWS Account if you don't have one:
   - Visit: https://aws.amazon.com
   - Click "Create an AWS Account"
   - Follow the registration process

2. Create an IAM User and Get Credentials:
   - Log in to AWS Console
   - Go to IAM (Identity and Access Management)
   - Create a new IAM user
   - Attach "AdministratorAccess" policy (for testing only, use more restricted policies in production)
   - Save the Access Key ID and Secret Access Key

3. Configure AWS CLI:
```bash
aws configure
```
You will be prompted for:
- AWS Access Key ID: [Enter your access key]
- AWS Secret Access Key: [Enter your secret key]
- Default region name: [Enter your preferred region, e.g., us-east-1]
- Default output format: [Press Enter for default json]

## 4. Verify Setup

1. Verify AWS CLI configuration:
```bash
aws sts get-caller-identity
```

## Important Security Notes:
1. Never commit AWS credentials to version control
2. Use IAM roles and policies with minimum required permissions
3. Enable MFA (Multi-Factor Authentication) for your AWS account
4. Regularly rotate your AWS access keys

## Troubleshooting:

### Common AWS CLI Issues:
- If `aws configure` doesn't work, check if AWS CLI is in your PATH
- Ensure your credentials are correct:
  - Linux/macOS: `~/.aws/credentials`
  - Windows: `C:\Users\USERNAME\.aws\credentials`
- Check your internet connection

### Common Terraform Issues:
- If `terraform` command is not found, check if it's in your PATH:
  - Linux/macOS: `/usr/local/bin/terraform` or `/usr/bin/terraform`
  - Windows: `C:\Program Files\Terraform` or `%USERPROFILE%\AppData\Local\Microsoft\WindowsApps` 