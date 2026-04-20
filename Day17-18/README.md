# 🚀 Day 17 – Configuration Management with Ansible

## 📌 What is Configuration Management?
Imagine you’re a **system administrator** managing 100 servers:
- 50 on Windows
- 25 on CentOS
- 25 on Ubuntu  

You need to:
1. Keep them **upgraded** (new versions, security patches).  
2. Install **default tools** (like Git or databases).  
3. Apply **security fixes** regularly.  

Doing this manually means logging into each server one by one — a nightmare if you have 1000+ servers in the cloud.

## 🛠️ Old Way vs New Way
- **Old Way**: Write scripts (Shell for Linux, PowerShell for Windows).  
  - Problem: Commands differ across OS/distributions. Scripts break easily.  
- **New Way**: Use tools like **Puppet, Chef, Salt, Ansible**.  
  - These tools automate upgrades, installations, and patches across all servers.

## 🚀 Why Ansible is Better
Abhishek explained with examples:

1. **Push vs Pull**  
   - Puppet = **Pull model** → Each server pulls updates from a master.  
   - Ansible = **Push model** → You write a Playbook on your laptop and **push** it to all servers at once.  
   - Example: 10 AWS EC2 servers → run one Ansible Playbook → all updated instantly.

2. **Agentless Architecture**  
   - Puppet needs a **master/slave setup** with agents installed on each server.  
   - Ansible = **No agents needed**. Just list server IPs in an **inventory file** + enable passwordless SSH.  
   - Example: Add new EC2 IPs → run Playbook → done. No extra setup.

3. **Dynamic Inventory**  
   - Cloud servers scale up/down daily.  
   - Ansible can **auto‑detect new servers** in AWS and manage them without manual updates.  
   - Example: IRCTC scaling servers during holidays → Ansible picks them up automatically.

4. **Simple Language (YAML)**  
   - Puppet requires learning Puppet DSL.  
   - Ansible uses **YAML**, already familiar from Kubernetes and other DevOps tools.  
   - Example: Writing a Playbook feels like writing a simple checklist.

5. **Cross‑Platform Support**  
   - Works well with Linux, and now has strong Windows modules (thanks to Red Hat).  

6. **Custom Modules + Ansible Galaxy**  
   - You can write your own modules in Python.  
   - Share them via **Ansible Galaxy** for others to use.  
   - Example: Create a module for Nginx load balancer → share → other teams reuse it.

## ⚠️ Limitations
- Windows support is not as smooth as Linux.  
- Debugging logs can be tricky.  
- Performance issues at very large scale (10k+ servers).  

## 🎯 Key Takeaway
- Without configuration management → chaos.  
- With Ansible → **simple, scalable, agentless automation**.  
- Learn Ansible first → 90% of companies use it.  

---

# 🚀 Day 18 – Ansible ZERO to HERO

🖥️ What We Did
Today we played with **Ansible**, a tool that helps us control many computers at once without typing commands on each one.

Think of it like a **remote control** for servers:
- Instead of pressing buttons on 100 TVs one by one,
- You press one button, and *all TVs change channel together*.

That’s what Ansible does for servers.

---

## 🚀 Step 1: Install Ansible
On our Linux machine (Ubuntu EC2 instance):
```bash
sudo apt update
sudo apt install ansible
```
This makes Ansible ready to use.

## 🔑 Step 2: Passwordless Login
We set up **passwordless authentication** so Ansible can talk to other servers without asking for a password every time.

How?
- Create a **key** (like a secret handshake).
- Share the **public key** with the target server.
- Now Ansible can connect freely.

## ⚡ Step 3: Ad‑Hoc Commands
Ad‑Hoc = **Quick one‑time commands**.

Example:
```bash
ansible -i inventory all -m shell -a "touch devops_class"
```
This created a file called `devops_class` on the target server.  
It’s like saying: *“Hey, all servers, make this file right now!”*

## 📒 Step 4: Playbooks
Playbooks = **Reusable scripts** written in YAML.  
They are like a recipe card: step‑by‑step instructions.

Example Playbook:
```yaml
---
- name: Install and restart NGINX
  hosts: all
  become: true
  become_user: root

  tasks:
    - name: Install nginx
      apt:
        name: nginx
        state: present
    - name: Start nginx
      service:
        name: nginx
        state: started
```

This tells Ansible:
1. Install NGINX web server.
2. Start NGINX service.

## 🎯 Key Difference
- **Ad‑Hoc Commands** → Quick, one‑time tasks (like turning on a light).  
- **Playbooks** → Organized, repeatable tasks (like following a recipe).

## 🌟 Takeaway
Ansible makes life easy:
- One control for many servers.
- No need to repeat commands.
- Perfect for automation.

---

## 📌 References
- Abhishek Veeramalla’s DevOps series ([YouTube](https://www.youtube.com/playlist?list=PLdpzxOOAlwvIc1TjTwopNSjRJkzES2ZXk))
  
---
Thanks to Abhishek Veeramalla’s DevOps 90‑Day Challenge for clear explanations and practical examples.
---
