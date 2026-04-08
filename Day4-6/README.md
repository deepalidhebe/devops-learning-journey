## 📘 Day 4 Notes – Virtual Machines & Hypervisors

### 🔑 Key Concepts
- **Virtual Machines (VMs):**  
  Logical computer systems created on top of physical servers. Each VM has its own CPU, memory, and storage, isolated from others.
- **Physical Servers vs. VMs:**  
  Physical servers often waste resources when apps use only a fraction of capacity. VMs solve this by partitioning resources efficiently.
- **Hypervisor:**  
  Software layer that enables virtualization. It creates and manages VMs on physical servers.  
  Examples: **VMware**, **Xen**, **Oracle VirtualBox**.

### 🏡 Real‑World Analogy
- Owning **1 acre of land** but only using half → wasted resources.  
- By building another house on unused land and renting it out, you maximize efficiency.  
- Similarly, virtualization allows multiple teams/apps to share one physical server without interfering.

### 💻 Server Example
- A company buys **5 physical servers**.  
- Each app only uses ~10% of server capacity → 90% wasted.  
- Virtualization partitions servers into multiple VMs, each serving a team/app efficiently.

### ☁️ Cloud Context
- Providers like **AWS, Azure, Google Cloud** run massive data centers.  
- They install hypervisors on physical servers.  
- When you request a VM (e.g., AWS EC2 instance in Mumbai region), the hypervisor provisions it logically and returns access details (IP, credentials).  
- You don’t own the physical machine — only the virtual environment.

### ⚡ Efficiency in DevOps
- DevOps is about **automation + efficiency**.  
- Virtualization embodies this by maximizing server utilization, reducing waste, and enabling scalability.

Thanks for confirming — this transcript is indeed your **Day 5 notes** from the DevOps Zero to Hero series. Here's a clean, structured summary you can commit to your GitHub repo or share on LinkedIn:

---

## 📘 Day 5 Notes – Creating Virtual Machines (AWS, Azure, On-Premise)

### 🔑 Key Concepts
- **Virtual Machines (VMs):**  
  Logical compute environments provisioned on cloud or on-premise infrastructure.
- **Cloud Providers Covered:**  
  - **AWS (Amazon Web Services)** → EC2 instances  
  - **Azure (Microsoft)** → Virtual Machines  
  - **On-Premise** → Manual VM creation on physical servers

---

### 🧑‍💻 Manual VM Creation via UI
- **AWS Console:**  
  - Login → EC2 → Launch Instance  
  - Choose OS (Ubuntu recommended for DevOps)  
  - Select **Free Tier eligible** instance (e.g., t2.micro)  
  - Create **Key Pair (.pem)** for SSH access  
  - Launch and access via IP + key

- **Azure Portal:**  
  - Similar flow: Login → Virtual Machines → Create  
  - Azure returns IP + credentials for access

---

### ⚙️ Automation in DevOps
Manual creation is inefficient for scale. DevOps focuses on **efficiency through automation**.

#### 🔧 Automation Tools for AWS
| Tool | Description |
|------|-------------|
| **AWS CLI** | Command-line interface for scripting VM creation |
| **AWS API** | Direct REST API calls to provision resources |
| **Boto3 (Python)** | Python SDK to interact with AWS services |
| **CloudFormation (CFT)** | Declarative templates to define infrastructure |
| **AWS CDK** | Code-based infrastructure using familiar languages |
| **Terraform** | Multi-cloud automation tool (supports AWS, Azure, GCP) |

---

### 🧠 Interview Insights
- If asked how you automate infrastructure:
  - Mention **Terraform** for multi-cloud setups.
  - Mention **CDK, CLI, or CFT** for AWS-only setups.
- Choose tools based on **organization strategy**:
  - AWS-focused → CDK or CFT preferred.
  - Hybrid cloud → Terraform is ideal.

---

### 🌐 Hybrid Cloud Strategy
- Organizations use **multiple cloud platforms** for different workloads:
  - AI/ML → Google Cloud  
  - Databases → AWS  
  - Kubernetes → GCP or Azure  
- Terraform shines in these setups due to its **provider-agnostic** nature.

---
Here’s a clean summary of your **Day 6 transcript** (connecting to EC2 from Windows using MobaXterm), so you can add it to your GitHub repo or share on LinkedIn:

---

## 📘 Day 6 Notes – Connecting to EC2 from Windows (MobaXterm)

### 🔑 Problem
- Many Windows users struggle to connect to AWS EC2 instances.  
- Common issues: confusion with **PuTTY**, `.ppk` file conversion, or reliance on AWS browser terminal.

---

### 🧑‍💻 Solution: Use **MobaXterm**
A simpler and more user‑friendly alternative to PuTTY.

#### Steps:
1. **Launch EC2 Instance**
   - Choose Ubuntu (e.g., `t2.micro`, free tier).
   - Create a **key pair** (`.pem` file) → download it locally.
   - Ensure **Public IP** and **SSH (port 22)** are enabled.

2. **Install MobaXterm**
   - Download **Community Edition (Installer)** from official site.
   - Extract and install → open MobaXterm.

3. **Configure SSH Session**
   - Go to **Sessions → SSH**.
   - Enter **Host name** = EC2 Public IP.
   - **Username** = `ubuntu`.
   - Under **Advanced SSH settings**, select **Use private key** → choose your `.pem` file.

4. **Connect**
   - Accept the pop‑up → you’re inside the EC2 instance.
   - Verify with commands like:
     ```bash
     sudo apt update
     ```

---

### ⚡ Key Takeaways
- **MobaXterm** is easier than PuTTY for Windows users.  
- No need to convert `.pem` to `.ppk`.  
- Provides a clean interface for SSH, SFTP, and terminal access.  
- Great option for beginners learning AWS + DevOps on Windows.

---
