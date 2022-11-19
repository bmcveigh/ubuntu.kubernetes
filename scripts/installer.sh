# Installs Kubernetes on Ubuntu Desktop.
#
# This also installs the required dependencies for it as well.
# In this script, it makes Kubernetes utilize the Docker runtime
# for container images.

sudo apt-get update -y

sudo apt install vim curl -y

echo "Installing minikube..."
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
# Remove no longer needed file.
rm -rf ./minikube-linux-amd64

# Install Kompose. This should help convert docker-compose.yml files into kubernetes
# config files.
# See: https://kubernetes.io/docs/tasks/configure-pod-container/translate-compose-kubernetes/
echo "Installing Kompose..."
curl -L https://github.com/kubernetes/kompose/releases/download/v1.26.0/kompose-linux-amd64 -o kompose
chmod +x kompose
sudo mv ./kompose /usr/local/bin/kompose

echo "Installing Docker..."
 sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# Download the Docker keyring for Ubuntu if not installed.
if [ ! -f /etc/apt/keyrings/docker.gpg ]; then
  sudo mkdir -p /etc/apt/keyrings
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
fi

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null


# This will help make minukube work.
sudo usermod -aG docker $USER && newgrp docker
