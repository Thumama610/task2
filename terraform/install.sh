#!/bin/bash

#microk8s
sudo snap install microk8s --classic
sudo microk8s enable dns 
sudo microk8s enable dashboard 
sudo microk8s enable storage
sudo snap alias microk8s.kubectl kubectl
sudo usermod -a -G microk8s $USER
sudo chown -f -R $USER ~/.kube

#nginx
sudo apt update
sudo apt install -y nginx

#awscli
sudo apt update
sudo apt install -y curl unzip
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

#docker
sudo apt update
sudo apt upgrade -y
sudo apt install ca-certificates curl gnupg -y
sudo install -m 0755 -d /etc/apt/keyrings

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
https://download.docker.com/linux/ubuntu \
$(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update

sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
sudo usermod -aG docker $USER
sudo systemctl start docker
sudo systemctl enable docker
