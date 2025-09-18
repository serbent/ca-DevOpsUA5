# 63. sample application on EKS.

Create a new policy
```bash
aws iam create-policy \
    --policy-name AWSLoadBalancerControllerIAMPolicy \
    --policy-document file://iam_policy.json
```

Retrieve your cluster's OIDC provider ID and store it in a variable
```bash
oidc_id=$(aws eks describe-cluster --name k8s-demo --query "cluster.identity.oidc.issuer" --output text | cut -d '/' -f 5)
```
Determine whether an IAM OIDC provider with your cluster's ID is already in your account. You need OIDC configured for both the cluster and IAM
```bash
aws iam list-open-id-connect-providers | grep $oidc_id | cut -d "/" -f4
```
Create the IAM role:
```bash
aws iam create-role \
  --role-name AmazonEKSLoadBalancerControllerRole \
  --assume-role-policy-document file://"load-balancer-role-trust-policy.json"
  ```
Attach the required Amazon EKS managed IAM policy to the IAM role. Replace 111122223333 with your account ID
```bash
aws iam attach-role-policy \
  --policy-arn arn:aws:iam::111122223333:policy/AWSLoadBalancerControllerIAMPolicy \
  --role-name AmazonEKSLoadBalancerControllerRole
```

Create the Kubernetes service account on your cluster.  
```bash
kubectl apply -f aws-load-balancer-controller-service-account.yaml
```

Install cert-manager:
```bash
kubectl apply \
    --validate=false \
    -f https://github.com/jetstack/cert-manager/releases/download/v1.13.5/cert-manager.yaml
```
Install AWS Load Balancer Controller using a Kubernetes manifest. Download the controller specification
```bash
curl -Lo v2_7_1_full.yaml https://github.com/kubernetes-sigs/aws-load-balancer-controller/releases/download/v2.7.1/v2_7_1_full.yaml
```
run the following command to remove the ServiceAccount section in the manifest
```bash
sed -i.bak -e '596,604d' ./v2_7_1_full.yaml
```
Replace your-cluster-name in the Deployment spec
```bash
sed -i.bak -e 's|your-cluster-name|my-cluster|' ./v2_7_1_full.yaml
```

Apply the file
```bash
kubectl apply -f v2_7_1_full.yaml
kubectl apply -f v2_7_1_ingclass.yaml
```

Verify that the controller is installed
```bash
kubectl get deployment -n kube-system aws-load-balancer-controller
```

Deploy application
```bash
kubectl apply -f game-2048.yaml
```
Get the public address 
```bash
kubectl get ingress/ingress-2048 -n game-2048
```


