# Security Group
resource "aws_security_group" "allow_ssh" {
  name        = "${var.environment}-allow-ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.environment}-sg"
  }
}

# EC2 Instance
resource "aws_instance" "main" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  key_name      = aws_key_pair.main.key_name

  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  tags = {
    Name = "${var.environment}-instance"
  }
}

# SSH Key Pair
resource "aws_key_pair" "main" {
  key_name   = "${var.environment}-key"
  public_key = file(var.public_key_path)
} 