# Hello DevOps World 🚀

This project shows how I used **Terraform + AWS EC2 + Docker + Nginx** to deploy a simple web page:  
```
Hello DevOps World
It's me Deepali Dhebe :)
```
---

## 🧩 Project Flow

1. **Write Terraform code (`main.tf`)**  
   - Creates a **Security Group** (opens port 80 for HTTP and port 22 for SSH).  
   - Launches an **EC2 instance** with Amazon Linux.  
   - Uses **user_data script** to install Docker and run my container.

2. **Write Dockerfile**  
   - Base image: `nginx:alpine` (lightweight web server).  
   - Copy my `index.html` into Nginx’s default folder.  

3. **Push Docker image to Docker Hub**  
   - Built image locally.  
   - Tagged and pushed to my Docker Hub account (`deepali83/hello-devops-world:latest`).  

4. **Terraform Apply**  
   - Terraform provisions EC2.  
   - EC2 pulls my Docker image and runs it.  
   - Public IP is output.  

5. **Browser Test**  
   - Open the public IP in browser → see my HTML page live.  

---

## 🧩 Project Flow with Commands

### 1. Terraform Setup
```bash
terraform init          # initialize Terraform
terraform plan          # preview changes
terraform apply         # create resources (type 'yes' when asked)
terraform destroy       # delete resources
```

### 2. Docker Basics
```bash
docker ps               # list running containers
docker ps -a            # list all containers (running + stopped)
docker stop <id>        # stop a container
docker rm <id>          # remove a container
docker images           # list images
docker rmi <id>         # remove an image
docker rmi -f $(docker images -q)   # remove ALL images
```

### 3. Build & Push Image
```bash
docker build -t hello-devops:latest .                # build image
docker tag hello-devops:latest deepali83/hello-devops-world:latest
docker login                                          # login to Docker Hub
docker push deepali83/hello-devops-world:latest       # push image
```

### 4. EC2 Key Pair
```bash
chmod 400 deepali-key.pem                             # fix permissions
ssh -i deepali-key.pem ec2-user@<public-ip>           # connect to EC2
```

### 5. Inside EC2
```bash
sudo docker ps                                        # check containers
sudo docker run -d -p 80:80 deepali83/hello-devops-world:latest
```

👉 If you want `docker` without `sudo`:
```bash
sudo usermod -aG docker ec2-user
exit
ssh -i deepali-key.pem ec2-user@<public-ip>           # reconnect
docker ps                                             # now works without sudo
```

### 6. Browser Test
Open:
```
http://<public-ip>
```
You’ll see:
```
Hello DevOps World
It's me Deepali Dhebe :)
```

---

## 📂 Files

### `main.tf`
```hcl
resource "aws_security_group" "hello_sg" {
  name        = "hello-devops-sg"
  description = "Allow HTTP and SSH inbound traffic"
  vpc_id      = "vpc-0d71b3392751f9cb3"   # default VPC ID

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
  key_name      = "deepali-key"   # my AWS key pair

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
```

---

### `Dockerfile`
```dockerfile
FROM nginx:alpine
COPY index.html /usr/share/nginx/html/index.html
```

---

### `index.html`
```html
<h1>Hello DevOps World</h1>
<h2>It's me Deepali Dhebe :)</h2>
```

---

## 🛠️ Issues We Faced & Fixes

1. **No container running after Terraform apply**  
   - Cause: Wrong Docker ID name (`deepalidhebe/...`).  
   - Fix: Corrected to `deepali83/hello-devops-world:latest`.

2. **SSH Permission Denied**  
   - Cause: No key pair attached to EC2.  
   - Fix: Created `deepali-key` in AWS, added `key_name` in Terraform, used `.pem` file locally.

3. **Docker permission denied**  
   - Cause: `ec2-user` not in Docker group.  
   - Fix: Used `sudo docker run ...` or added `ec2-user` to Docker group inside EC2.

4. **Local vs Remote confusion**  
   - At first, I ran `docker ps` locally and saw nothing.  
   - Fix: Realized containers run **inside EC2**, not on my laptop. SSH in to check.

5. **Final Success**  
   - After fixes, container ran and browser showed my HTML page 🎉.

---

## 🌐 Final Output

Browser screenshot:  

<img width="573" height="191" alt="image" src="https://github.com/user-attachments/assets/796729a5-b40d-403e-9278-a7e888ae0b5c" />

