# 🚀 Day 27 – Docker Networking

## 📌 What I Learned
- **Why networking matters in Docker**  
  Containers need networking to:
  - Communicate with each other (e.g., frontend ↔ backend).  
  - Communicate with the host system.  
  - Provide isolation when required (e.g., login vs finance containers).

- **Comparison with Virtual Machines**  
  - VMs have their own OS and subnet isolation by default.  
  - Containers are lightweight and share the host kernel, so Docker provides networking options to manage communication and isolation.

## 🔑 Key Concepts
1. **Default Bridge Network**
   - Created automatically (`docker0` virtual ethernet).  
   - Allows containers to talk to each other and to the host.  
   - Example: Login and Logout containers can ping each other.

2. **Host Network**
   - Containers share the host’s network stack.  
   - Fast communication but **less secure** (no isolation).  
   - Example: `--network=host`.

3. **Overlay Network**
   - Used in orchestration (Docker Swarm, Kubernetes).  
   - Enables communication across multiple hosts.  
   - More advanced, not needed for single-host Docker setups.

4. **Custom Bridge Networks**
   - Created by user for logical isolation.  
   - Example: Finance container isolated from Login/Logout containers.  
   - Command:  
     ```bash
     docker network create secure_network
     docker run -d --name finance --network=secure_network nginx
     ```

## 🛠️ Practical Demo
- **Step 1:** Run containers with default bridge network.  
  ```bash
  docker run -d --name login nginx
  docker run -d --name logout nginx
  ```
  - Both containers can ping each other (same subnet).

- **Step 2:** Create a custom bridge network for secure isolation.  
  ```bash
  docker network create secure_network
  docker run -d --name finance --network=secure_network nginx
  ```
  - Finance container is isolated; Login cannot ping Finance.

- **Step 3:** Run a container with host networking.  
  ```bash
  docker run -d --name host_demo --network=host nginx
  ```
  - Shares host’s IP, but insecure.

## ✅ Takeaways
- **Bridge networking** is the default and most flexible.  
- **Custom bridge networks** provide logical isolation for sensitive workloads.  
- **Host networking** is fast but insecure.  
- **Overlay networking** is for multi-host orchestration setups.
