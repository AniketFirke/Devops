# 🚀 AWS Auto Scaling with ALB and CloudWatch

This project demonstrates how to build a **highly available and scalable AWS infrastructure** using:

- Amazon EC2
- Application Load Balancer (ALB)
- Auto Scaling Group (ASG)
- Amazon CloudWatch

---

# 🧊 Architecture

```mermaid
flowchart TB

User --> ALB
ALB --> EC2_1
ALB --> EC2_2
EC2_1 --> ASG
EC2_2 --> ASG
ASG --> CloudWatch
CloudWatch --> ScalingPolicies
```

---

# 📁 Project Structure

```
aws-autoscaling-alb-project
│
├── scripts
│   └── install-web.sh
│
├── diagrams
│   └── architecture.png
│
└── README.md
```

---

# ⚙️ Services Used

- Amazon EC2
- Application Load Balancer
- Auto Scaling Group
- Amazon CloudWatch

---

# 🚀 Deployment Steps

### 1 Create Key Pair

```
aws ec2 create-key-pair --key-name MyKeyPair
```

### 2 Launch Base EC2 Instance

Install web server.

```
sudo yum install httpd -y
```

---

### 3 Create AMI

Create an image from EC2 instance.

---

### 4 Create Load Balancer

```
Application Load Balancer
Listener: HTTP 80
```

---

### 5 Create Launch Template

Configure:

- AMI
- Instance Type
- Key Pair
- Security Group

---

### 6 Create Auto Scaling Group

```
Min: 1
Max: 3
Desired: 2
```

Attach to ALB target group.

---

### 7 Configure Scaling Policies

Scale Out:

```
CPU > 70%
```

Scale In:

```
CPU < 30%
```
---

# 🔄 Architecture Flowchart

```mermaid
flowchart TB
    User --> ALB
    ALB --> EC2_1
    ALB --> EC2_2
    EC2_1 --> ASG
    EC2_2 --> ASG
    ASG --> CloudWatch
    CloudWatch -->|CPU > 70%| ScaleOut
    CloudWatch -->|CPU < 30%| ScaleIn
```
---

```mermaid
flowchart LR
    UserTraffic --> ALB
    ALB --> EC2Instances
    EC2Instances --> CloudWatch
    CloudWatch --> ScalingPolicy
    ScalingPolicy --> ASG
    ASG --> NewEC2Instances
```
---

# 🧪 Testing Auto Scaling

Generate CPU load:

```
yes > /dev/null &
```

Stop load:

```
pkill yes
```

---
# 🔄 Screenshot 
 
 ![alt text](<diagrams/architecture 1.jpg>)

---

 ![alt text](<diagrams/architecture 2.png>)

---

 ![alt text](<diagrams/architecture 3.png>)

----

 ![alt text](diagrams/SpeedWindowsAutoScaling.png)

---

# 🔄 DevOps Infrastructure

 ![alt text](<diagrams/DevOps Infrastructure/Infrastructure.jpg>)

---

 ![alt text](<diagrams/DevOps Infrastructure/User.png>)

 ---

# 🎯 Key Benefits

✔ High Availability  
✔ Fault Tolerance  
✔ Automatic Scaling  
✔ Load Distribution  
✔ Cost Optimization  

---

# 👨‍💻 Author
<a href = "https://cinch-revamp-60906406.figma.site/"> Mr.Aniket A Firke</a>
<br>
DevOps Engineer  
AWS | Terraform | Docker | CI/CD
