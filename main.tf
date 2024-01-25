provider "aws" {
  region = "us-east-1"  # Set your desired AWS region
}

resource "aws_security_group" "example_security_group" {
  name        = "Test-SG"
  description = "Example SG for CI/CD pipeline"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["1.2.3.4/32"]
    description = "SSH access"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["5.6.7.8/32"]
    description = "----"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "----"
  }

  tags = {
    Name = "example-security-group"
  }
}

# Test webhook from GitHub:
# test2.1