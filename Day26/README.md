# 📦 Day 26 - Docker Bind Mounts & Volumes

## 🚀 Introduction

In Docker, one of the most confusing topics for beginners is:

*   Bind Mounts
*   Volumes

But don’t worry — once you understand the **problem**, these concepts become very simple ✅

---

## ❗ Why Do We Need Volumes?

### 🔴 Problem 1: Data Loss (Ephemeral Containers)

Docker containers are **ephemeral (short-lived)**.

👉 Example:

*   You run an **Nginx container**
*   It writes logs: user IP, login details
*   Container crashes ❌
*   Logs are **LOST**

<!---->

    [Container]
       │
       ├── logs.txt (deleted when container stops ❌)

👉 Impact:

*   No audit logs
*   No history
*   Huge issue in production

### 🔴 Problem 2: Data Sharing Between Containers

👉 Example:

*   Backend container → writes file
*   Frontend container → reads file

<!---->

    [Backend] ----writes----> file.json ----reads----> [Frontend]

❌ If backend crashes → data lost  
→ Frontend cannot show old data

### 🔴 Problem 3: Access Host Files

👉 Example:

*   Cron job creates file on host
*   Container wants to read it

<!---->

    [Host Machine]
       └── data.json  ← created by cron

    [Container]
       └── ❌ Cannot access directly

## ✅ Solution: Docker Mounts

Docker provides 2 solutions:

### 1️⃣ Bind Mounts

### 2️⃣ Volumes

---

# 📌 1. Bind Mounts

## ✅ Concept

Bind **host directory ↔ container directory**

    [Host]             [Container]
    /app   <------->   /app

### ✅ Key Idea

*   Direct mapping
*   Whatever changes → reflected both sides

## ✅ Example

```bash
docker run -d \
  --mount type=bind,source=/home/ubuntu/app,target=/app \
  nginx
```

## ✅ Behavior

| Scenario              | Result                |
| --------------------- | --------------------- |
| Container writes file | Saved on host ✅       |
| Container deleted     | Data still exists ✅   |
| New container         | Can reuse same data ✅ |

## ⚠️ Limitations

*   Tight dependency on host path
*   Not portable
*   Manual management required

---

# 📌 2. Docker Volumes (Recommended ✅)

## ✅ Concept

Docker manages storage automatically.

    [Docker Volume]  --->  [Container]
         │
         └── Stored inside Docker-managed location

## ✅ Why Volumes?

✔ Better lifecycle management  
✔ Portable  
✔ Secure  
✔ High performance  
✔ Can use external storage (NFS, S3, etc.)

## ✅ Volume Lifecycle

### 🔹 Create Volume

```bash
docker volume create deepali
```

### 🔹 List Volumes

```bash
docker volume ls
```

### 🔹 Inspect Volume

```bash
docker volume inspect deepali
```

### 🔹 Delete Volume

```bash
docker volume rm deepali
```

⚠️ Note: Must remove container first

## ✅ Using Volume with Container

### ✅ Using `--mount` (Recommended)

```bash
docker run -d \
  --mount source=deepali,target=/app \
  nginx
```

### 🔍 What Happens?

    [Volume: deepali]
            │
            ▼
    [Container: /app]

✔ Data persists even if container stops  
✔ Can attach to multiple containers

## ✅ Verify Mount

```bash
docker inspect <container_id>
```

Look for:

    "Mounts": [
      {
        "Source": "...",
        "Destination": "/app"
      }
    ]

## 🚧 Important Rule

👉 You **CANNOT delete volume if container is using it**

❌ This will fail:

```bash
docker volume rm deepali
```

✅ Correct flow:

```bash
docker stop <container>
docker rm <container>
docker volume rm deepali
```

***

# ⚔️ Bind Mount vs Volume

| Feature          | Bind Mount | Volume      |
| ---------------- | ---------- | ----------- |
| Managed by       | User       | Docker ✅    |
| Portability      | Low        | High ✅      |
| Performance      | Normal     | High ✅      |
| Lifecycle        | Manual     | Automatic ✅ |
| External storage | No         | Yes ✅       |

***

# 🧠 Best Practice

✅ Always prefer **Volumes**

Use Bind Mount only when:

*   You need direct host access
*   Dev environment testing

***

## 🔧 -v vs --mount
Both do same thing

### ➤ `-v` (Short)

```bash
docker run -v deepali:/app nginx
```

### ➤ `--mount` (Verbose ✅)

```bash
docker run \
  --mount source=deepali,target=/app \
  nginx
```

✅ Recommended: `--mount`  
✔ More readable  
✔ Easy for teams

***

# 🧪 Real DevOps Insight

👉 Containers = stateless  
👉 Volumes = state storage

**Golden Rule:**

> Never store important data inside container directly

***

# ✅ Summary

*   Containers are **ephemeral → data loss issue**
*   Bind mounts → simple but limited
*   Volumes → powerful & production-ready ✅
*   Use volumes for:
    *   Logs
    *   Shared data
    *   Database storage
    *   Backups

***

# ✅ Next Steps

Try below hands-on:

```bash
docker volume create testvol

docker run -it \
  --mount source=testvol,target=/app \
  ubuntu bash
```

Then:

```bash
cd /app
touch file1.txt
```

Stop container → start again → file will still exist ✅
