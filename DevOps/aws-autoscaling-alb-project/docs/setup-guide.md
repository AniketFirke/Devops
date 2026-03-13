
# ⚙️ Setup Guide

## ⚙️ Step 1: Create Key Pair

Create SSH key for EC2 access.

```bash
aws ec2 create-key-pair \
--key-name MyKeyPair \
--query 'KeyMaterial' \
--output text > MyKeyPair.pem
````

Set permission:

```bash
chmod 400 MyKeyPair.pem
```

---

## ⚙️ Step 2: Create AMI

Create image for scaling.

EC2 Console:

**EC2 → Instances → Actions → Image → Create Image**

Example name:

```
autoscaling-demo-ami
```

This AMI will be used by Auto Scaling Group.

---

## ⚙️ Step 3: Create Application Load Balancer

Go to:

**EC2 → Load Balancers → Create Load Balancer**

Select:

**Application Load Balancer**

Configuration:

| Setting      | Value           |
| ------------ | --------------- |
| Listener     | HTTP (80)       |
| Target Group | New             |
| Health Check | /index.html     |
| Scheme       | Internet Facing |

---

## ⚙️ Step 4: Create Launch Template

Go to:

**EC2 → Launch Templates → Create Launch Template**

Configuration:

| Setting        | Value                |
| -------------- | -------------------- |
| AMI            | autoscaling-demo-ami |
| Instance Type  | t2.micro             |
| Key Pair       | MyKeyPair            |
| Security Group | HTTP + SSH           |

---

## ⚙️ Step 5: Create Auto Scaling Group

Go to:

**EC2 → Auto Scaling Groups → Create**

Configuration:

| Setting          | Value               |
| ---------------- | ------------------- |
| Launch Template  | Created template    |
| Desired Capacity | 2                   |
| Min              | 1                   |
| Max              | 3                   |
| Load Balancer    | Attach target group |

---

## ⚙️ Step 6: Configure Scaling Policy

Create scaling rules.

**Scale Out**

* CPU > 70%
* Add 1 instance

**Scale In**

* CPU < 30%
* Remove 1 instance

---

## ⚙️ Step 7: Configure CloudWatch Alarm

Navigate:

**CloudWatch → Alarms → Create Alarm**

Select metric:

**EC2 → Auto Scaling Group → CPU Utilization**

Set thresholds.

| Alarm     | Condition |
| --------- | --------- |
| Scale Out | CPU > 70% |
| Scale In  | CPU < 30% |

---

## ⚙️ Step 8: Test Auto Scaling

Open ALB DNS:

```
http://ALB-DNS-NAME
```

Output:

```
Welcome to Auto Scaling Demo!
```

### Simulate High CPU Load

SSH into instance:

```bash
yes > /dev/null &
```

This increases CPU usage and triggers scale out.

### Stop Load Test

```bash
pkill yes
```

CloudWatch triggers scale in.

