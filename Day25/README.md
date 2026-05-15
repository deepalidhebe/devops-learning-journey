# 🚀 Day 25 - Multi-Stage Docker Build with Distroless Images (Golang Example)

This project demonstrates how to use **Multi-Stage Docker Builds** along with **Distroless Images** to optimize Docker image size, performance, and security.

---

## 📌 Project Overview

The application is a simple **Golang-based Calculator** that takes user input and performs basic operations.

`
git clone https://github.com/iam-veeramalla/Docker-Zero-to-Hero.git
`

---

This repository focuses on:
- Comparing **normal Docker build vs multi-stage build**
- Understanding **image size optimization**
- Implementing **distroless (minimal) containers**

## 🧠 Key Concepts

### ✅ Multi-Stage Docker Builds
Multi-stage builds allow you to:
- Separate **build environment** and **runtime environment**
- Reduce final image size
- Avoid unnecessary dependencies in production images

### ✅ Distroless Images
Distroless images:
- Contain only the application and required runtime
- Do **NOT include package managers, shells, or unnecessary tools**
- Improve **security and efficiency**

---

## ⚙️ Prerequisites

Make sure you have installed:
- Docker
- Go (optional, only if testing locally)

---

## ▶️ Running Without Multi-Stage Build

### 🔹 To run Golang calculator app
```bash
go run calculator.go
````
<img width="985" height="529" alt="image" src="https://github.com/user-attachments/assets/f0daed5b-4c0f-4fa9-a0f1-af25692a96bc" />


### 🔹 Build Image
```bash
docker build -t simple-calculator .
````

### 🔹 Run Container

```bash
docker run -it simple-calculator
```

### 📊 Result

*   Image size: \~800MB+
*   Contains unnecessary OS packages and build dependencies

<img width="1055" height="90" alt="image" src="https://github.com/user-attachments/assets/2c69994f-bfa7-434d-9e59-c5271c10fd6f" />

---

## ▶️ Running With Multi-Stage Build

### 🔹 Build Image

```bash
docker build -t simple-calculator-multistage .
```

### 🔹 Run Container

```bash
docker run -it simple-calculator-multistage
```

### 📊 Result

*   Image size: \~2MB
*   Only contains compiled binary
*   No extra tools or OS dependencies

<img width="827" height="112" alt="image" src="https://github.com/user-attachments/assets/a93799f0-b2e5-4908-a191-0262e4dc765f" />

---

## ⚡ Key Comparison

| Feature      | Without Multi-Stage | With Multi-Stage |
| ------------ | ------------------- | ---------------- |
| Image Size   | \~800MB             | \~2MB            |
| Performance  | Lower               | Higher           |
| Security     | Lower               | Higher           |
| Dependencies | Many                | Minimal          |

---

## 🔍 How It Works

### 🧱 Stage 1 (Build Stage)

*   Uses Ubuntu/Golang base image
*   Installs dependencies
*   Builds binary

### 🚀 Stage 2 (Final Stage)

*   Uses **scratch (distroless)** image
*   Copies only compiled binary
*   Runs the application

---

## 📦 Sample Multi-Stage Dockerfile

```dockerfile
# Stage 1 - Build
FROM golang:1.20 AS build
WORKDIR /app
COPY calculator.go .
RUN go build -o calculator

# Stage 2 - Minimal Image
FROM scratch
COPY --from=build /app/calculator /calculator
ENTRYPOINT ["/calculator"]
```

---

## 🔐 Why Use Distroless?

*   Reduces attack surface
*   No shell access = more secure
*   Smaller and faster deployments

---

## 🎯 Conclusion

Using **Multi-Stage Docker Builds + Distroless Images**:

*   ✅ Reduced image size drastically
*   ✅ Improved security
*   ✅ Optimized runtime performance
