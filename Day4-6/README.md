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

---
