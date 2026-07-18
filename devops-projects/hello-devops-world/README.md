# 🚀 Hello DevOps World on AWS EC2 <img width="132" height="32" alt="image" src="https://github.com/user-attachments/assets/e3cfefa1-4abd-4e3d-bbd5-6f5c96921812" />


This project demonstrates how to deploy a simple **Flask web application** using **Docker** on an **AWS EC2 instance**.  
It’s a beginner‑friendly DevOps project that shows the complete journey:  
**Code → Container → Docker Hub → EC2 → Browser.**

---

## 📂 Project Files
- **app.py** → A small Flask app that returns “Hello, DevOps World!”  
- **Dockerfile** → Instructions to build the Docker image with Python + Flask.

---

## 📝 Step‑by‑Step Guide

### 1. Write the Python app
```python
from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello():
    return 'Hello, DevOps World!'

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)
```

### 2. Create the Dockerfile
```dockerfile
FROM python:3.9-slim
WORKDIR /app
COPY app.py /app
RUN pip install flask
EXPOSE 5000
CMD ["python", "app.py"]
```

### 3. Build the Docker image
```bash
docker build -t hello-devops .
```

### 4. Tag the image for Docker Hub
```bash
docker tag hello-devops deepali83/hello-devops:v1
```
### 5. Push the image to Docker Hub
```bash
docker push deepali83/hello-devops:v1
```
### 6. Run the container on EC2
```bash
docker run -d -p 8080:5000 deepali83/hello-devops:v1
```
### 7. Open in browser
Visit:
```
http://<EC2-Public-IP>:8080
```
Example: `http://3.108.289.178:8080`

<img width="712" height="233" alt="image" src="https://github.com/user-attachments/assets/c1a93303-2b25-40aa-afad-d71d76a846b0" />

---

## 📊 Architecture Flow

```
Browser (Your Laptop)
        |
        v
   http://<EC2-Public-IP>:8080
        |
        v
   AWS EC2 Instance
        |
        v
   Docker Container
        |
        v
   Flask App (app.py)
        |
        v
 "Hello, DevOps World!"
```

---

## ✅ What You Learn
- How to containerize a Python app with Docker.  
- How to push images to Docker Hub.  
- How to run containers on AWS EC2.  
- How to expose ports and configure Security Groups.  

---

## 🌟 Next Steps
- Automate EC2 setup with **Terraform**.  
- Add **CI/CD pipeline** using Jenkins or GitHub Actions.  
- Deploy more complex apps (Django, Node.js, etc).  

---
🔗 Docker Hub: [deepali83](https://hub.docker.com/u/deepali83)  
---
