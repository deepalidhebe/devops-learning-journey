# Day 22 – Introduction to Containers

## 🌍 Context
After exploring physical servers and virtual machines, today’s focus was on **containers** — the next evolution in resource efficiency and application deployment.

## 🔑 Key Learnings
- **Virtual Machines Recap**: Each VM runs a full OS, providing strong isolation but often wasting unused CPU/RAM.
- **Why Containers?**
  - Lightweight: share the host OS kernel instead of bundling a full OS.
  - Faster startup and smaller image sizes (MBs vs GBs).
  - Easier portability across environments.
- **Architecture Models**:
  - Containers directly on physical servers.
  - Containers on top of VMs (common in cloud providers like AWS EC2).
- **Docker Lifecycle**:
  - Write a `Dockerfile` → build into an **image** → run as a **container**.
  - Commands: `docker build`, `docker run`.
- **Drawbacks**:
  - Less isolation compared to VMs.
  - Docker Engine introduces a **single point of failure**.
- **Builder Introduction**:
  - Alternative to Docker for building OCI-compliant images.
  - Avoids layer bloat, integrates with Podman/Scorpio.
  - Uses shell scripts instead of Dockerfiles.

---

# Day 23 – Docker Basics & Terminology

## 🌍 Context
Building on Day 22’s introduction to containers, today’s focus was on **Docker** — the most widely used containerization platform.  
Understanding Docker’s architecture, lifecycle, and terminology is essential before moving into advanced orchestration tools like Kubernetes.

## 🔑 Key Learnings
- **Why Containers Are Lightweight**  
  - Containers don’t carry a full OS; they rely on the host kernel.  
  - They include only application code, dependencies, and minimal system files.  
  - Example: Ubuntu VM image ≈ 2.3 GB vs Ubuntu Docker image ≈ 28 MB.

- **Docker Architecture**  
  - **Docker CLI** → user interface for commands.  
  - **Docker Daemon** → core service that builds, runs, and manages containers.  
  - **Docker Registry** → centralized storage (e.g., Docker Hub) for images.  
  - **Docker Images & Containers** → images are blueprints; containers are running instances.

- **Lifecycle of Docker**  
  1. Write a **Dockerfile** (set of instructions).  
  2. Build into a **Docker image** (`docker build`).  
  3. Run the image as a **container** (`docker run`).  
  4. Push/pull images to/from registries (`docker push`, `docker pull`).

- **Terminology**  
  - **Dockerfile**: Script with build instructions.  
  - **Image**: Snapshot containing app + dependencies.  
  - **Container**: Running instance of an image.  
  - **Registry**: Repository for storing/sharing images.  
  - **Docker Desktop**: Local environment for managing Docker.
