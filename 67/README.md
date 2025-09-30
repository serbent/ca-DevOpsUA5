# 67. LOKI stack

## Prerequisites
1. Kubernetes cluster
2. Helm installed.

## Installation process

Add grafana repo 
```bash
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update
```

Install loki
```bash
helm upgrade --install loki --namespace=loki-stack grafana/loki-stack --values loki-stack-values.yaml --create-namespace
```

Install grafana
```bash
helm upgrade --install grafana-agent --namespace=loki-stack grafana/grafana-agent --values grafana-agent-values.yaml
```

Froward ports
```bash
kubectl port-forward svc/loki-grafana 3000:80 -n loki-stack
```

Get login secret
```bash
kubectl get secret loki-grafana -n loki-stack -o jsonpath="{.data.admin-password}" | base64 --decode ; echo
```
