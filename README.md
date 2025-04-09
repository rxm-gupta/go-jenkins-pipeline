# Go Jenkins Pipeline 🚀

This is a basic CI/CD project demonstrating how to build and deploy a Go web application using **Docker** and **Jenkins** on an **AWS EC2 instance**.

---

## 🔧 Prerequisites & Setup Guide

Before running this project, make sure the following tools are installed and configured on your system (or EC2 instance):

### ✅ Prerequisites

- **EC2 instance (Ubuntu 22.04 preferred)**
- **Git**
- **Docker**
- **Jenkins**
- **Java 11 (OpenJDK)**
- Open ports `8080` (Jenkins) and `8081` (App) in your EC2 Security Group

### 📦 Install Everything (Ubuntu quick setup)

```bash
# Update system
sudo apt update && sudo apt upgrade -y

# Install Git
sudo apt install git -y

# Install Java 11
sudo apt install openjdk-11-jdk -y

# Install Docker
sudo apt install docker.io -y
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker $USER

# Install Jenkins
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt update
sudo apt install jenkins -y
sudo systemctl enable jenkins
sudo systemctl start jenkins
```

---

## 🌐 Jenkins Setup & Pipeline

1. Open Jenkins: `http://<EC2-IP>:8080`
2. Unlock it: `sudo cat /var/lib/jenkins/secrets/initialAdminPassword`
3. Install **Suggested Plugins** and also:
   - Git Plugin
   - Docker Pipeline
   - GitHub Plugin
4. Create a new **Pipeline Job**
   - Pipeline from SCM
   - Git Repo: `https://github.com/rxm-gupta/go-jenkins-pipeline.git`
   - Script Path: `Jenkinsfile`

---

## 🛠️ Tech Stack

- **Go (Golang)**: Web app backend
- **Docker**: App containerization
- **Jenkins**: CI/CD pipeline
- **AWS EC2**: Hosting server

---

## 📁 Project Structure

```
go-jenkins-pipeline/
├── main.go          # Go web app with health + metrics
├── go.mod           # Go module
├── Dockerfile       # Docker build instructions
├── Jenkinsfile      # Jenkins pipeline definition
└── README.md        # You’re reading it!
```

---

## 🚀 How to Run Locally

```bash
# Clone the repo
git clone https://github.com/rxm-gupta/go-jenkins-pipeline.git
cd go-jenkins-pipeline

# Build and run with Docker
docker build -t go-jenkins-pipeline .
docker run -d -p 8081:8080 --name go-jenkins-container go-jenkins-pipeline

# Test the app
curl http://localhost:8081/health
```

---

## 🔁 CI/CD Pipeline Overview

The Jenkins pipeline performs:

1. ✅ Clone repository from GitHub
2. 🐳 Build Docker image (`go-jenkins-pipeline`)
3. 🚀 Run Docker container on port `8081`
4. 🔁 Webhook triggers Jenkins on push

---

## 🧠 Author

**rxm-gupta**  
[GitHub Profile »](https://github.com/rxm-gupta)

---

## 📸 Screenshots

![Image](https://github.com/user-attachments/assets/22be7cb7-df9c-460c-8e25-af048218e6d7)

