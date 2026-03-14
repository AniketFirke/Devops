
## ⚙️ Step 1: Setup AWS CloudWatch Monitoring

Navigate to:

AWS Console → CloudWatch → Logs

Create:

Log Group  
Log Stream  

Example:



/aws/ec2/application-logs


---

## ⚙️ Step 2: Install CloudWatch Agent on EC2

Connect to EC2 instance.

Install agent:

```bash
sudo yum install -y amazon-cloudwatch-agent
````

Run configuration wizard:

```bash
sudo amazon-cloudwatch-agent-config-wizard
```

Start agent:

```bash
sudo systemctl start amazon-cloudwatch-agent
```

Verify:

CloudWatch → Logs → Log Streams

You should see logs from EC2.

---

## ⚙️ Step 3: Configure CloudWatch Alarms

Navigate:

CloudWatch → Alarms → Create Alarm

Example metric:

```
CPUUtilization
```

Threshold:

```
CPU > 70%
```

Action:

Send notification via SNS

---

## ⚙️ Step 4: Deploy ELK Stack on EC2

Launch EC2:

```
Ubuntu 20.04
t2.medium recommended
```

---

## ⚙️ Step 5: Install Java

```bash
sudo apt update
sudo apt install openjdk-11-jdk -y
```

Verify:

```bash
java -version
```

---

## ⚙️ Step 6: Install Elasticsearch

```bash
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.17.9-linux-x86_64.tar.gz
tar -xvf elasticsearch-7.17.9-linux-x86_64.tar.gz
```

Start service:

```bash
sudo systemctl start elasticsearch
```

Check:

```
http://<EC2-IP>:9200
```

---

## ⚙️ Step 7: Install Logstash

```bash
wget https://artifacts.elastic.co/downloads/logstash/logstash-7.17.9-linux-x86_64.tar.gz
tar -xvf logstash-7.17.9-linux-x86_64.tar.gz
```

Start Logstash:

```bash
sudo systemctl start logstash
```

---

## ⚙️ Step 8: Install Kibana

```bash
wget https://artifacts.elastic.co/downloads/kibana/kibana-7.17.9-linux-x86_64.tar.gz
tar -xvf kibana-7.17.9-linux-x86_64.tar.gz
```

Start Kibana:

```bash
sudo systemctl start kibana
```

Access dashboard:

```
http://<EC2-IP>:5601
```

---

## ⚙️ Step 9: Integrate CloudWatch with ELK

Export logs to S3.

Navigate:

CloudWatch → Logs → Subscription Filter

Send logs to:

```
S3 Bucket
```

---

## ⚙️ Step 10: Logstash S3 Input Plugin

Update Logstash config:

```bash
input {
 s3 {
   bucket => "your-bucket-name"
   access_key_id => "AWS_ACCESS_KEY"
   secret_access_key => "AWS_SECRET_KEY"
 }
}
```

Logs will now flow:

```
CloudWatch → S3 → Logstash → Elasticsearch
```

---

## ⚙️ Step 11: Create Kibana Dashboard

Open:

```
http://<EC2-IP>:5601
```

Create index pattern:

```
logs-*
```

Then build dashboards for:

Error logs

CPU events

System logs


