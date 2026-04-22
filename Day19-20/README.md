# Day 19 - Infrastructure as Code & API as Code

## 🚀 What I Learned
Today I explored two important DevOps ideas:
1. **Infrastructure as Code (IaC)** – writing code to create servers, databases, and storage instead of clicking buttons manually.
2. **API as Code** – using Terraform to talk to cloud providers (AWS, Azure, GCP, etc.) through their APIs, so one tool works everywhere.

## 🏢 Example Story
Imagine I am a DevOps Engineer at Flipkart.  
Flipkart has 300 apps, and they need servers to run them.  

- First, we decided to use **AWS**.  
  I wrote scripts called **CloudFormation Templates (CFTs)** to create EC2 servers, S3 buckets, and RDS databases automatically.  
  Example:  
  ```bash
  aws cloudformation create-stack --stack-name myapp --template-body file://ec2.yaml
  ```

- Later, management wanted to move to **Azure**.  
  My AWS scripts didn’t work here. I had to rewrite them using **Azure Resource Manager (ARM)** templates.

- Then, we shifted to **on‑premises servers** with **OpenStack**.  
  Again, I had to rewrite everything using **Heat Templates**.

This was tiring because every cloud had its own language!

## 🌩️ Hybrid Cloud Problem
Some companies use **AWS for storage** and **Azure for DevOps tools** at the same time.  
That means engineers must learn both AWS CFT and Azure ARM.  
If tomorrow they add GCP, that’s yet another tool to learn.  
This is where **Terraform** comes to the rescue.

## 🛠️ Terraform – One Tool for All Clouds
Terraform (by HashiCorp) lets me write **one script** that works across AWS, Azure, GCP, or even OpenStack.  
It talks to each cloud’s **API** behind the scenes.

Example:  
```hcl
provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "example" {
  ami           = "ami-123456"
  instance_type = "t2.micro"
}
```

If tomorrow I want to move to Azure, I just change the provider details instead of rewriting everything from scratch.

## 📖 What is an API?
- Normally, you open Google in a browser and type something → that’s **User Interface**.  
- But if you want to talk to Google programmatically, you use an **API**.  
- Example:  
  ```bash
  curl https://api.github.com/users/octocat
  ```
  This talks directly to GitHub’s API and gives data back.

Terraform uses the same idea:  
- I write simple Terraform code.  
- Terraform converts it into API calls for AWS, Azure, or GCP.  
- The cloud provider creates the resources for me.

## 🌟 Key Takeaways
- **Infrastructure as Code (IaC):** Automating servers with scripts (CFT, ARM, Heat).  
- **API as Code (Terraform):** One tool that works with all clouds using APIs.  
- Saves time, avoids rewriting, and makes migrations smoother.

---

# Day 20 – Terraform ZERO to HERO

## 📚 What I Learned
- How to install Terraform on **Ubuntu**.
- The **Terraform lifecycle**: `init`, `plan`, `apply`, `destroy`.
- Writing **Terraform configuration files** with providers and resources.
- Using **local state files** first, then moving to **remote backends** (like AWS S3).
- Why Terraform is better than cloud‑specific tools (CFT, ARM, Heat).
- How to use **Terraform modules** and collaborate via Git.

## 🛠️ Why Terraform?
- One tool for **all clouds** (AWS, Azure, GCP, OpenStack).  
- Standardized configuration (`.tf` files).  
- Easy migration between providers.  
- Collaboration via Git repos.  
- Track infrastructure using **state files**.  

## 🔄 Terraform Lifecycle
1. **Write configuration files** (`main.tf`).  
2. **Initialize provider** →  
   ```bash
   terraform init
   ```
   (Sets up AWS provider and plugins).  
3. **Dry run / plan** →  
   ```bash
   terraform plan
   ```
   (Shows what will be created/changed).  
4. **Apply changes** →  
   ```bash
   terraform apply
   ```
   (Actually creates resources).  
5. **Destroy resources** →  
   ```bash
   terraform destroy
   ```
   (Deletes resources created by Terraform).  

## 🖥️ Installing Terraform on Ubuntu
Update and install via apt:  
```bash
sudo apt-get update
sudo apt-get install -y terraform
```

Check installation:  
```bash
terraform -version
```

## 📄 First Terraform File (Example)
```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "example" {
  ami           = "ami-123456"
  instance_type = "t2.micro"
}
```

### Explanation
- `terraform` block → defines providers and version.  
- `provider` block → tells Terraform which cloud and region.  
- `resource` block → defines what to create (here, an EC2 instance).  

## 📂 GitHub Repository
I cloned Abhishek’s repo to practice using command: 

```bash
git clone https://github.com/iam-veeramalla/write_your_first_terraform_project.git
```
This repo contains:
- Example Terraform files (`main.tf`, `variables.tf`).  
- Local state and remote backend examples.  
- Step‑by‑step project setup.  

## 🌟 Key Takeaways
- Start with **local state** before remote backends.  
- Always run `terraform plan` before `apply`.  
- Use Git repos to collaborate and review changes.  
- Terraform makes cloud automation **simpler and universal**.  

---

## 📌 References
- GitHub Repo: [write_your_first_terraform_project](https://github.com/iam-veeramalla/write_your_first_terraform_project.git)  
- Terraform Docs: [AWS Instance Resource](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance)
- Abhishek Veeramalla’s DevOps Course: [Youtube](https://www.youtube.com/watch?v=G1BRnIHBBig&list=PLdpzxOOAlwvIc1TjTwopNSjRJkzES2ZXk&index=19)  
