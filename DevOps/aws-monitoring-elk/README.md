# 🚀 AWS Monitoring & Logging using ELK Stack and CloudWatch

This project demonstrates how to implement **centralized logging and monitoring** for AWS infrastructure using:

- Amazon CloudWatch
- ELK Stack (Elasticsearch, Logstash, Kibana)
- Amazon S3

---

# 🧊 Architecture

```mermaid
flowchart TB

EC2 --> CloudWatchLogs
CloudWatchLogs --> S3
S3 --> Logstash
Logstash --> Elasticsearch
Elasticsearch --> Kibana
Kibana --> Dashboard
```

---

# 📁 Project Structure

```
aws-monitoring-elk
│
├── elk-config
│   ├── elasticsearch.yml
│   ├── logstash.conf
│   └── kibana.yml
│
├── scripts
│   ├── install-elk.sh
│   └── cloudwatch-agent.sh
│
└── README.md
```

---

# ⚙️ Services Used

- AWS CloudWatch
- Amazon S3
- Elasticsearch
- Logstash
- Kibana
- EC2

---

# 🚀 Deployment Steps

### 1 Install CloudWatch Agent

```
sudo yum install amazon-cloudwatch-agent
```

---

### 2 Deploy ELK Stack

Install:

- Elasticsearch
- Logstash
- Kibana

---

### 3 Configure Logstash

Example pipeline:

```
input → logs
output → elasticsearch
```

---

### 4 Visualize Logs

Access Kibana:

```
http://EC2-IP:5601
```

Create index:

```
logs-*
```

---
# 🔄 Monitoring Architecture Flowchart

```mermaid
flowchart TB

    EC2 --> CloudWatchLogs
    CloudWatchLogs --> S3Bucket
    S3Bucket --> Logstash
    Logstash --> Elasticsearch
    Elasticsearch --> Kibana
    Kibana --> Dashboard
```

---

# 🔄 Observability Pipeline

```mermaid

flowchart LR
    Application --> Logs
    Logs --> CloudWatch
    CloudWatch --> S3
    S3 --> Logstash
    Logstash --> Elasticsearch
    Elasticsearch --> Kibana
    Kibana --> MonitoringDashboard
```

---

# 📸 Screenshots

![alt text](<diagrams/architecture 1.png>)

---

![alt text](<diagrams/architecture 2.png>)

---

![alt text](diagrams/grafana.jpg)

---

# 📸 Observability-Infrastructure

![alt text](diagrams/Observability-Infrastructure/elk-stack.png)

---

![alt text](diagrams/Observability-Infrastructure/observability.png)

---

![alt text](diagrams/Observability-Infrastructure/Sampledashboard.png)

---

# 🎯 Benefits

✔ Centralized Logging  
✔ Real-Time Monitoring  
✔ Fast Log Search  
✔ Infrastructure Observability  
✔ Alerting and Notifications  

---

# 👨‍💻 Author
<a href = "https://cinch-revamp-60906406.figma.site/"> Mr.Aniket A Firke</a>
<br>
DevOps Engineer  
AWS | Terraform | Docker | CI/CD | Monitoring
