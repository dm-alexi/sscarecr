#!/usr/bin/env bash

sudo mv kubernetes.repo /etc/yum.repos.d
sudo yum install -y kubectl yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y docker-ce docker-ce-cli containerd.io
sudo systemctl enable --now docker
VERSION=$(curl --silent "https://api.github.com/repos/argoproj/argo-cd/releases/latest" | grep '"tag_name"' | sed -E 's/.*"([^"]+)".*/\1/')
sudo curl -sSL -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/download/v2.1.6/argocd-linux-amd64
sudo chmod +x /usr/local/bin/argocd
sudo usermod -aG docker "${USER}"
newgrp docker
