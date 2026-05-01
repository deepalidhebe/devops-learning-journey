## 📘 Day 24 – Deploying Django App in Docker

### 🔹 What I Learned
- **Containerization recap (Day 23–24):**
  - Why containers are lightweight compared to VMs.
  - How Docker architecture works (daemon, registry, lifecycle).
  - Permissions issues when installing Docker on EC2.

- **Django basics for DevOps engineers:**
  - Project skeleton created with `django-admin startproject devops`.
  - Application created with `python manage.py startapp demo`.
  - Key files:
    - `settings.py` → project configuration (DB, middleware, templates).
    - `urls.py` → routing (`/demo/`, `/admin/`).
    - `views.py` → logic to render templates.
    - `templates/` → HTML content served to browser.

### 🔹 Dockerizing the Django App
1. **Base Image:**  
   Used `ubuntu:latest` (could also use `python:3.x` to skip manual Python install).
2. **Workdir:**  
   `/app` → standard location for source code.
3. **Copy Files:**  
   - `requirements.txt` → Python dependencies (`Django`, `tzdata`).  
   - Source code → `devops/` + `demo/`.
4. **Install Dependencies:**  
   ```dockerfile
   RUN apt-get update && apt-get install -y python3 python3-pip python3-venv
   RUN pip install -r requirements.txt
   ```
5. **Expose Port:**  
   `EXPOSE 8000`
6. **Entrypoint vs CMD:**  
   - **ENTRYPOINT** → fixed executable (`python3`).  
   - **CMD** → configurable arguments (`manage.py runserver 0.0.0.0:8000`).

### 🔹 Running the Container
```bash
docker build -t deepali83/my-first-docker-image:latest .
docker run -it -p 8000:8000 deepali83/my-first-docker-image
```

### 🔹 Command Used
```bash
git clone https://github.com/iam-veeramalla/Docker-Zero-to-Hero
docker login
docker build .
docker images
docker run
```

- Maps container port **8000** → host port **8000**.
- Accessible at `http://<EC2-public-IP>:8000/demo/` or `/admin/`.

### 🔹 Key Takeaways
- Containers solve the “works on my machine” problem by bundling dependencies.  
- As a DevOps engineer, you don’t need to be a Django developer, but you must understand the **workflow** to containerize apps.  
- ENTRYPOINT vs CMD is a common interview question — ENTRYPOINT is fixed, CMD is flexible.  
- Port mapping (`-p`) is essential to access containerized web apps externally.
