resource "aws_security_group" "hello_sg" {
  name        = "hello-devops-sg"
  description = "Allow HTTP and SSH inbound traffic"
  vpc_id      = "vpc-0d71b3392751f9cb3"   # your default VPC ID

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
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
}

resource "aws_instance" "hello" {
  ami           = "ami-02b1e663aa8e2a28a"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.hello_sg.id]
  key_name      = "deepali-key"   # replace with your actual AWS key pair name

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras enable docker
              yum install -y docker
              systemctl enable docker
              systemctl start docker
              docker run -d -p 80:80 deepali83/hello-devops-world:latest
              EOF

  tags = {
    Name = "HelloDevOpsWorld"
  }
}

output "instance_ip" {
  value = aws_instance.hello.public_ip
}
