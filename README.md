# Installation steps

```bash
# brew install go
# go install sigs.k8s.io/kind@v0.19.0
# sudo mv ./kind /usr/local/bin/kind

kind create cluster --name kind-argo-cd

# Install ArgoCD

kubectl create namespace argocd

kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# Create environment
kubectl create namespace mapspiral

kubectl kustomize applications | kubectl apply -f -

# ./port-forward.sh

```