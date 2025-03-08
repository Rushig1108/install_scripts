#!/bin/bash

# Update System
sudo apt update -y && sudo apt upgrade -y

# Install Java (Required for Jenkins)
sudo apt install -y openjdk-11-jdk

# Install Jenkins
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt update -y
sudo apt install -y jenkins

# Start & Enable Jenkins Service
sudo systemctl enable jenkins
sudo systemctl start jenkins

# Wait for Jenkins to initialize
echo "Waiting for Jenkins to start..."
sleep 60


# Display Completion Message
echo "Jenkins is installed! Access it at: http://<your-server-ip>:8080"


