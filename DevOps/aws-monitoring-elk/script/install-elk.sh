#!/bin/bash

echo "Updating system packages..."
sudo apt update -y

echo "Installing Java (required for ELK)..."
sudo apt install -y openjdk-11-jdk

echo "Adding Elastic GPG Key..."
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -

echo "Adding Elastic Repository..."
echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | \
sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list

sudo apt update -y

echo "Installing Elasticsearch..."
sudo apt install -y elasticsearch

echo "Configuring Elasticsearch..."
sudo sed -i 's/#network.host: .*/network.host: 0.0.0.0/' /etc/elasticsearch/elasticsearch.yml
echo "discovery.type: single-node" | sudo tee -a /etc/elasticsearch/elasticsearch.yml

echo "Starting Elasticsearch..."
sudo systemctl daemon-reload
sudo systemctl enable elasticsearch
sudo systemctl start elasticsearch

echo "Installing Logstash..."
sudo apt install -y logstash

echo "Installing Kibana..."
sudo apt install -y kibana

echo "Configuring Kibana..."
sudo sed -i 's/#server.host: "localhost"/server.host: "0.0.0.0"/' /etc/kibana/kibana.yml

echo "Starting Kibana..."
sudo systemctl enable kibana
sudo systemctl start kibana

echo "ELK Stack installation completed!"
echo "Access Kibana at: http://<EC2-PUBLIC-IP>:5601"