# 55-56. Kubernetes

## Usefull commands 

Enable auto-complete:
```bash
echo 'source <(kubectl completion bash)' >>~/.bashrc
source ~/.bashrc
```

Get all resources in current namespace:
```bash
kubectl get all
```

Get specific resources: 
```
kubectl get <RESOUCE_TYPE>
kubectl get po,deploy,svc,hpa
```
Get logs:
```bash
kubectl logs <POD_NAME>
```
Get resource information:
```bash
kubectl describe <RESOUCE_TYPE> <RESOURCE_NAME>
kubectl describe svc nginx-service
```
Delete resource:
```bash
kubectl delete <RESOUCE_TYPE> <RESOURCE_NAME>
kubectl delete svc nginx-service
```
Portforward for service access:
```bash
kubectl port-forward svc/<SERVICE_NAME> <HOST_PORT>/<TARGET_PORT>
kubectl port-forward svc/nginx-service 8080:80
```
Imperative approach:
```bash
kubectl run --image=nginx nginx
```
Declarative approach:
Apply configuration:
```bash
kubectl apply -f deployment.yml
```
Delete configuration:
```bash
kubectl delete -f deployment.yml
```
