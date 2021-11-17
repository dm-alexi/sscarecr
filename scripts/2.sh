#!/usr/bin/env bash

curl -s https://raw.githubusercontent.com/rancher/k3d/main/install.sh | bash
k3d cluster create mycluster
kubectl create namespace dev
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
