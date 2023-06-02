# README

This repository contains source files to demonstrate different ways to use Argo CD applications:

- a Kubernetes manifest;
- a Kustomization;
- a Helm Chart.

# Local development

First, you need to get a Kind cluster and Argo CD up and running:

```bash
# brew install go
# go install sigs.k8s.io/kind@v0.19.0
# chmod +x ./kind && sudo mv ./kind /usr/local/bin/kind

printf "Creating Kind cluster...\n"
kind create cluster --name kind-argo-cd

printf "Installing Argo CD...\n"
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

printf "Creating target namespace...\n"
kubectl create namespace mapspiral

printf "Creating Argo CD Applications...\n"
kubectl kustomize applications | kubectl apply -f -
```

Next, give Argo CD some time to synchronize the application before continuing.

Finally, expose the created pods using `./port-forward.sh`.
