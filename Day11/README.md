# 🚀 Day 11 - AWS Resource Tracker

## 📌 Overview
This project demonstrates how to use **Shell Scripting + AWS CLI** to automate daily reporting of AWS resource usage.  
It’s a practical DevOps project that highlights **automation, cost optimization, and cloud monitoring** — skills highly valued in real-world environments.

## ⚙️ Prerequisites
- **AWS CLI** installed and configured (`aws configure`)
- **Valid AWS credentials** (Access Key, Secret Key, Default Region)
- **Bash shell** (Linux/Unix environment recommended)
- **Optional:** `jq` installed for parsing JSON output

## 🛠️ Resources Tracked
- **S3 Buckets**
- **EC2 Instances** (Instance IDs only)
- **Lambda Functions**
- **IAM Users**

## 📂 Files
- `aws_resource_tracker.sh` → Main script
- `sample-output.txt` → Example of generated report
- `README.md` → Documentation

## ▶️ Usage
1. Clone the repo:
   ```bash
   git clone https://github.com/deepalidhebe/devops-learning-journey.git
   cd Day11/
   ```

2. Make script executable:
   ```bash
   chmod 777 aws_resource_tracker.sh
   ```

3. Run the script:
   ```bash
   ./aws_resource_tracker.sh
   ```

4. Check the generated report:
   ```bash
   cat resourceTracker
   ```

## 📑 Sample Output
```
AWS Resource Usage Report - Sat Apr 11 21:36:00 IST 2026
----------------------------------------

[S3 Buckets]
my-devops-bucket

[EC2 Instances]
i-0abcd1234efgh5678
i-0xyz9876mnop5432

[Lambda Functions]
process-data-fn
cleanup-fn

[IAM Users]
deepali
devops-admin
```

## ⏰ Automating with Cron
To schedule the script daily at 6 PM:
```bash
crontab -e
```
Add:
```
0 9 * * * /home/ubuntu/deepali/aws_resource_tracker.sh
```

---

This README makes your repo look **professional and recruiter‑ready**.  

👉 Do you want me to also draft a **LinkedIn carousel caption** (short, visual‑friendly points) so you can share this project as a Day 11 milestone post?
