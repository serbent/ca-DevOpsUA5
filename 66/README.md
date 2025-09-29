# Kubernetes Lab: Kind, Nginx, and 2048 Game

This guide will walk you through:
- Installing [kind](https://kind.sigs.k8s.io/)
- Creating a local Kubernetes cluster with kind
- Installing Nginx ingress controller
- Deploying the 2048 game using Helm

---

## 1. Install kind

Kind lets you run Kubernetes clusters locally using Docker containers.

**Install via script:**
```bash
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.30.0/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind
```

Or use your package manager if available.

---

## 2. Create a kind cluster

```bash
kind create cluster --name dev-cluster --config=cluster02.yaml
```

To check your cluster:
```bash
kubectl cluster-info --context kind-dev-cluster
```

---

## 3. Install Helm

If Helm is not installed:
```bash
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
```

---

## 4. Install nginx Ingress Controller

Install the controller:
```bash
kubectl apply -f https://kind.sigs.k8s.io/examples/ingress/deploy-ingress-nginx.yaml
```

---

## 5. Deploy 2048 Game with Helm

Clone the 2048 repo:
```bash
git clone https://github.com/paulroesch/helm-2048.git /tmp/helm-2048
```

Install the 2048 game:
```bash
helm upgrade -i game-2048 /tmp/helm-2048
```

---

## 6. Access the 2048 Game
Update the values.yaml to look like this:
```yaml
ingress:
  enabled: true
  className: ""
  annotations: {}
    # kubernetes.io/ingress.class: nginx
    # kubernetes.io/tls-acme: "true"
  hosts:
    - host: localhost
```
Update the deployment
```bash
helm upgrade -i game-2048 /tmp/helm-2048
```
Now your game ld be accessible on http://localhost/

---

## References
- [kind documentation](https://kind.sigs.k8s.io/docs/)
- [Helm documentation](https://helm.sh/docs/)
- [2048 repository](https://github.com/paulroesch/helm-2048)
