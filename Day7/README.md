# Day 7 – AWS CLI & EC2 Automation

## 📌 Overview
In this session, I explored efficient ways to create and manage AWS EC2 instances using automation tools. Instead of relying solely on the AWS Management Console (UI), we learned how DevOps engineers can leverage **AWS CLI, CloudFormation, and Python boto3** for faster, repeatable workflows.

## 🔑 Key Learnings
- **Virtual Machines Recap**  
  - What VMs are and how they’re created (covered in Day 0–6).
  - Why automation is critical for DevOps engineers.

- **Connecting to EC2 Instances**
  - **UI Method:** Using AWS Console → EC2 Dashboard → Connect option.  
  - **Terminal Method:** SSH into EC2 using public IP + key pairs.  
    - Fixed PEM file permission issues with `chmod 600`.

- **Terminals for Different OS**
  - Mac: iTerm recommended.  
  - Windows: PuTTY, MobaXterm, or NoMachine.  
  - Terminals allow faster, more convenient connections compared to UI.

- **AWS CLI Setup**
  - Download and install AWS CLI (Windows, Mac, Linux).  
  - Verify installation: `aws --version`.  
  - Configure credentials: `aws configure` (Access Key, Secret Key, Region, Output format).  
  - Example commands:  
    - List S3 buckets → `aws s3 ls`  
    - Create bucket → `aws s3api create-bucket --bucket deepali-devops-bucket --region ap-south-1 --create-bucket-configuration LocationConstraint=ap-south-1`  
    - Launch EC2 instance → `ssh -i "key_name" user@ip_address`

- **CloudFormation Templates**
  - Infrastructure as Code (IaC) introduction.  
  - Use sample templates from [AWS Labs GitHub](https://github.com/awslabs).  
  - Create stacks via AWS Console → CloudFormation → Upload template.

- **Python boto3 Automation**
  - boto3 integrates with AWS CLI configuration.  
  - Example: List running EC2 instances with a simple Python script.  
  - Documentation provides ready-to-use examples for automation.

## 📚 References
- [AWS CLI Documentation](https://docs.aws.amazon.com/cli/)  
- [AWS CloudFormation Templates – GitHub](https://github.com/awslabs/aws-cloudformation-templates)  
- [boto3 Documentation](https://boto3.amazonaws.com/v1/documentation/api/latest/index.html)

## ✅ Takeaway
By the end of Day 7, I am comfortable with:
- Logging into EC2 via both UI and terminal.  
- Installing and configuring AWS CLI.  
- Automating AWS tasks with CLI, CloudFormation, and boto3.  
- Understanding why automation is essential for scaling DevOps workflows.

---

# 📓 Day 8 – Linux & Shell Scripting Basics  

Today’s focus was on understanding the **Linux operating system** and the **fundamentals of shell scripting**.  

**Key takeaways:**  
- Operating System acts as a bridge between hardware (CPU, RAM, I/O) and software.  
- Why Linux dominates production: **free, secure, fast, and open-source**.  
- Linux architecture: **Kernel → System Libraries → Compilers/User Processes → System Software**.  
- Shell commands as the primary way to interact with servers (since GUIs are often absent).  
- Practiced essential commands:  
  - `pwd` → check current directory  
  - `ls` / `ls -ltr` → list files with details  
  - `cd` → navigate directories  
  - `touch` / `vi` → create and edit files  
  - `cat` → read file contents  
  - `mkdir`, `rm` → manage directories and files  
- Monitoring system resources:  
  - `free -m` → memory usage  
  - `nproc` → CPU count  
  - `df -h` → disk usage  
  - `top` → overall system monitoring (CPU, memory, processes)  

This session built the foundation for **real-time DevOps projects using shell scripting**, which we’ll explore next.

---

## Special Thanks to Abhishek Veeramalla

---
