# 🚀 Day 15 – Deploying Node.js on AWS EC2

## 📌 Overview
This project documents my hands‑on experience of moving a Node.js application from **local development** to a **cloud deployment** on AWS EC2.  
The goal was to understand how compute, networking, and security come together to make an application accessible to the real world.

## 🛠️ Tech Stack
- **Node.js** (Application runtime)
- **npm** (Package manager)
- **Git** (Version control)
- **AWS EC2** (Cloud compute instance)
- **IAM** (Identity & Access Management)
- **Linux (Ubuntu)** (Server OS)

## ⚙️ Steps Followed
1. **Clone Repository**
   ```bash
   git clone <repo-url>
   cd <repo-name>
   ```
2. **Set Environment Variables**
   - Create `.env` file  
   - Add required keys (e.g., `PORT`, `DOMAIN`, `STRIPE_SECRET_KEY`)
3. **Run Locally**
   ```bash
   npm install
   npm run start
   ```
   Access at: `http://localhost:3000`
4. **Launch EC2 Instance**
   - Created IAM user (instead of using root)
   - Downloaded `.pem` key
   - Connected via SSH:
     ```bash
     ssh -i my-key.pem ubuntu@<public-ip>
     ```
5. **Prepare Server**
   - Installed Node.js, npm, and Git
   - Cloned repo again
   - Recreated `.env` file
   - Started application
6. **Expose to Internet**
   - Configured **Security Groups**
   - Opened inbound rule for **port 3000**
   - Verified app running at `http://<ec2-public-ip>:3000`

## 🌍 Key Learning
Running an app on EC2 ≠ making it accessible.  
Networking and security (via **Security Groups**) are critical to exposing applications safely to the internet.

!(NodeJS Application)[NodeJS_AppDeployed.png]

## 🙌 Acknowledgements
Special thanks to **Abhishek Veeramalla** and **Kunal Verma** for their guidance and beginner‑friendly approach to cloud deployments.
