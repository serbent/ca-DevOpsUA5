# 59. NodePort, ClusterIP

## Install traefik controler for EKS

### Prerequisites

An EKS cluster up and running.
kubectl configured to talk to your cluster.
(Optional) helm installed – makes installation much easier.

### Installation 
Create a dedicated namespace:
```bash
kubectl create namespace traefik
```
Install Traefik using helm:
```bash
helm repo add traefik https://traefik.github.io/charts
helm repo update
helm install traefik traefik/traefik --wait \
  --set ingressRoute.dashboard.enabled=true \
  --set ingressRoute.dashboard.matchRule='Host(`dashboard.localhost`)' \
  --set ingressRoute.dashboard.entryPoints={web} \
  --set providers.kubernetesGateway.enabled=true \
  --set gateway.listeners.web.namespacePolicy.from=All \
  --namespace traefik
```
