# Docker Interview Questions & Answers

---

## 🎯 1️⃣ What is Docker?
Docker is an **open‑source containerization platform**.  
It helps you **build, run, and manage containers** easily.

### 🧪 Example:
```bash
docker --version
docker run hello-world
```
This verifies Docker installation and runs a test container.

---

## ⚖️ 2️⃣ Containers vs Virtual Machines
| Feature | Containers | Virtual Machines |
|----------|-------------|------------------|
| OS | Share host kernel | Full OS per VM |
| Size | Lightweight | Heavy |
| Speed | Starts in seconds | Slower |
| Isolation | Process-level | Hardware-level |

### 🧪 Example:
```bash
docker run -d --name web nginx
```
Runs a lightweight web server container — much faster than a VM boot.

---

## 🔄 3️⃣ Docker Lifecycle
Steps to manage containers:
1. **Write Dockerfile**
2. **Build Image**
3. **Run Container**
4. **Push to Registry**

### 🧪 Example:
```bash
# Step 1: Create Dockerfile
echo "FROM nginx" > Dockerfile

# Step 2: Build image
docker build -t mynginx .

# Step 3: Run container
docker run -d -p 8080:80 mynginx

# Step 4: Push to Docker Hub
docker tag mynginx username/mynginx:v1
docker push username/mynginx:v1
```

---

## ⚙️ 4️⃣ Docker Components
- **Client (CLI)** → Where you type commands  
- **Daemon (Engine)** → Executes commands in background  
- **Registry** → Stores images (e.g., Docker Hub)

### 🧪 Example:
```bash
docker pull nginx
docker images
docker ps
```

---

## 📂 5️⃣ COPY vs ADD
| Command | Purpose | Example |
|----------|----------|----------|
| COPY | Copies local files | `COPY ./app /usr/src/app` |
| ADD | Can copy from URLs or archives | `ADD https://example.com/file.tar.gz /app` |

---

## 🎯 6️⃣ CMD vs ENTRYPOINT
| Command | Behavior | Example |
|----------|-----------|----------|
| CMD | Default command (can override) | `CMD ["python", "app.py"]` |
| ENTRYPOINT | Fixed executable (always runs) | `ENTRYPOINT ["python", "app.py"]` |

### 🧪 Example:
```bash
# CMD example
docker run myimage echo "Hello"

# ENTRYPOINT example
docker run myimage "Hello"
```

---

## 🌐 7️⃣ Docker Networking Types
| Type | Description | Example |
|------|--------------|----------|
| Bridge (Default) | Containers talk via virtual bridge | `docker run -d --name web nginx` |
| Host | Shares host network (fast but insecure) | `docker run -d --network=host nginx` |
| Overlay | Connects containers across multiple hosts | Used in Swarm/Kubernetes |
| Macvlan | Gives containers their own IPs | Advanced setups |

---

## 🔒 8️⃣ Networking Isolation
Create custom bridge networks for secure containers.

### 🧪 Example:
```bash
docker network create secure_network
docker run -d --name finance --network=secure_network nginx
```
This isolates the **finance container** from others.

---

## 📦 9️⃣ Multi‑Stage Build
Used to reduce image size — build in multiple stages and copy only the final executable.

### 🧪 Example:
```dockerfile
# Stage 1: Build
FROM golang:1.20 AS build
WORKDIR /app
COPY . .
RUN go build -o main .

# Stage 2: Final
FROM alpine:latest
COPY --from=build /app/main /main
CMD ["/main"]
```

---

## 🛡️ 🔟 Distroless Images
Images without a full OS — more secure and lightweight.

### 🧪 Example:
```bash
# Pull a distroless image
docker pull gcr.io/distroless/base
```
