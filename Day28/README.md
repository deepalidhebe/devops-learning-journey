# 🎯 Day 28 – Docker Interview Questions & Answers

Link of the session : https://www.youtube.com/watch?v=I6ZBUEc4LrU&list=PLdpzxOOAlwvIc1TjTwopNSjRJkzES2ZXk&index=28

## 🧠 What This Session Covers
Today’s class was all about **Docker interview questions** — explained in a practical, scenario‑based way.  
These questions help you understand how to **talk about Docker confidently** in interviews, not just run commands.

---

## 💬 Key Questions & Simple Answers

### 1️⃣ What is Docker?
- Docker is an **open‑source containerization platform**.  
- It helps you **build, run, and manage containers** easily.  
- In interviews, say: “I use Docker to build images, write Dockerfiles, run containers, and push them to registries.”

---

### 2️⃣ How are Containers Different from Virtual Machines?
- Containers are **lightweight** — they don’t have a full OS.  
- They include only your **app, dependencies, and system libraries**.  
- VMs have a **complete OS**, making them heavier and slower.  
- Example: A Java app in a container only needs Java runtime + app files, not an entire Ubuntu OS.

---

### 3️⃣ What is Docker Lifecycle?
- Steps to manage containers:
  1. Write a **Dockerfile**  
  2. Build an **image** (`docker build`)  
  3. Run a **container** (`docker run`)  
  4. Push to **registry** (Docker Hub, ECR, etc.)  
  5. Pull and reuse when needed  

---

### 4️⃣ Docker Components
- **Client (CLI)** – where you type commands  
- **Daemon (Engine)** – runs in background, executes actions  
- **Registry** – stores images (like Docker Hub)  

---

### 5️⃣ Difference Between `COPY` and `ADD`
- `COPY` → copies files from your local system into the container.  
- `ADD` → can copy files **from URLs or remote sources** (like S3 or GitHub).  

---

### 6️⃣ Difference Between `CMD` and `ENTRYPOINT`
- `ENTRYPOINT` → defines the **main command** that always runs.  
- `CMD` → defines **default arguments** that can be overridden.  
- Example:  
  ```dockerfile
  ENTRYPOINT ["python", "app.py"]
  CMD ["--port", "8000"]
  ```
- CMD → Defines a default command that can be overridden when you run the container.
Example:
  ```dockerfile
  CMD ["python", "app.py"]
  ```
You can override it with:
  ``` bash
  docker run myimage echo "Hello"
  ```
- ENTRYPOINT → Defines a fixed executable that always runs when the container starts.
Example:
  ```dockerfile
  ENTRYPOINT ["python", "app.py"]
  ```
You can pass arguments like:
  ```bash
  docker run myimage "Hello"
  ```
---

### 7️⃣ Docker Networking Types
- **Bridge (Default)** – containers talk via `docker0` virtual bridge.  
- **Host** – container shares host’s network (fast but insecure).  
- **Overlay** – connects containers across multiple hosts.  
- **Macvlan** – makes container appear as a physical host.  

🟢 **Default:** Bridge Network  
Because it allows containers to communicate with each other and the host safely using a virtual bridge.

---

### 8️⃣ How to Isolate Networking Between Containers
- Create a **custom bridge network** for secure containers.  
  ```bash
  docker network create secure_network
  docker run -d --name finance --network=secure_network nginx
  ```
- This keeps sensitive containers (like payments) isolated from others.

---

### 9️⃣ What is Multi‑Stage Build?
- Used to **reduce image size**.  
- You build in multiple stages and copy only the final executable.  
- Example: Build app in one stage, copy binary to a lightweight final image.

---

### 🔟 What are Distroless Images?
- Images **without a full OS** (no shell, no package manager).  
- More secure and lightweight.  
- Only contain what’s needed to run your app.

---

## ✅ Takeaway
These questions help you explain Docker concepts clearly in interviews — not just technically, but **in simple words** that show real understanding.

---

Thanks Abhishek Veeramalla for making DevOps learning this much easier!
