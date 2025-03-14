# 🚀 Fintech CI/CD Pipeline

## 📌 Project Overview
This project implements a **fully automated CI/CD pipeline** for a fintech application with:
- **Multi-cloud deployment** (AWS & GCP)
- **Automated testing** (unit, integration, and load tests)
- **Observability** (Prometheus & Grafana)
- **Automated rollback** on failure


---

## 🚀 Setup & Deployment
### 1️⃣ Clone the Repository
```bash
git clone https://github.com/YOUR_USERNAME/XNL-21BAI10147-SDE-5.git
cd XNL-21BAI10147-SDE-5
```

### 2️⃣ Run the Application Locally
pip install -r src/requirements.txt
python src/app.py

Visit: http://localhost:5000

### 3️⃣ Run Tests
pytest tests/

### 4️⃣ Build and Run Docker Container
docker build -t fintech-app .
docker run -p 5000:5000 fintech-app

### 5️⃣ Deploy to Multi-Cloud (AWS & GCP)
bash scripts/deploy.sh

### 6️⃣ Observability Setup
Prometheus: http://your-prometheus-url:9090

Grafana: http://your-grafana-url:3000
---
