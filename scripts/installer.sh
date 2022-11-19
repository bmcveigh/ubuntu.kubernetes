# Installs Kubernetes on Ubuntu Desktop.
#
# This also installs the required dependencies for it as well.

sudo apt-get update -y

sudo apt install vim curl -y

curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube

echo "Installing Docker..."
#sudo apt-get install docker.io -y
#curl -fsSL https://get.docker.com -o get-docker.sh
#sudo sh get-docker.sh

 sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null


# This will help make minukube work.
sudo usermod -aG docker $USER && newgrp docker

