
# 🐳 Docker Basics Cheat Sheet

This guide helps you understand key Docker commands for working with **images**, **containers**, and **port mapping**.

---

## 📦 Docker Images

A **Docker image** is a set of files (code, libraries, tools) used to create a running environment called a **container**.

### 🔍 Search for Images on Docker Hub:
Visit: [https://hub.docker.com](https://hub.docker.com)  
Examples:
- `ubuntu`
- `alpine`

---

### ▶️ Run a Container from Docker Hub or Local Image:
```bash
docker run -it ubuntu
docker run -it alpine
```
- `-it` = interactive terminal (lets you use the command line inside the container)

---

### 📄 View All Local Images:
```bash
docker images
```

---

### ❌ Remove Docker Images:
```bash
docker image rm ubuntu
```
> Make sure no container is using the image.

### 🧹 Remove Multiple Images:
```bash
docker image rm ubuntu alpine
```

---

## 🧱 Docker Containers

A **Docker container** is a running instance of an image.

### 📋 View Running Containers:
```bash
docker ps
```

### 📋 View All Containers (Running + Stopped):
```bash
docker ps -a
```

---

### ❌ Remove a Container:
```bash
docker container rm <container_id>
```

### 🛑 Stop a Running Container:
```bash
docker stop <container_id>
```

---

### 🏷️ Name Your Container:
```bash
docker run --name sample -it alpine
```
- `--name sample` gives a custom name (`sample`) to the container.
- `-t` keeps the terminal active.

---

## 🛠️ Build Docker Image

### 🔨 Create Image from Dockerfile:
```bash
docker build -t imagename .
```
> `-t` gives the image a name. `.` means current directory has the Dockerfile.

---

## 🌐 Port Mapping

When your application listens on a port (like `3000`), map it to your system:

```bash
docker run -it -p 3000:3000 imagename
```

| Host Port | Container Port |
|-----------|----------------|
| `3000`    | `3000` (used in code/app) |

> You can then access the app on [http://localhost:3000](http://localhost:3000)

---

### 📌 Example Use Case:
If your Express.js app runs on port 3000:

```js
app.listen(3000, '0.0.0.0');
```

Then run:
```bash
docker run -it -p 3000:3000 expressapp
```

---

## ✅ Quick Reference

| Task                        | Command                             |
|-----------------------------|--------------------------------------|
| Run container               | `docker run -it ubuntu`             |
| List images                 | `docker images`                     |
| Remove image                | `docker image rm ubuntu`            |
| Remove multiple images      | `docker image rm ubuntu alpine`     |
| List running containers     | `docker ps`                         |
| List all containers         | `docker ps -a`                      |
| Remove a container          | `docker container rm <id>`          |
| Stop a container            | `docker stop <id>`                  |
| Name a container            | `docker run --name sample -it alpine` |
| Build an image              | `docker build -t imagename .`       |
| Port mapping                | `docker run -it -p 3000:3000 imagename` |

---

📝 **Tip**: Always make sure your containers are stopped before removing their images!
