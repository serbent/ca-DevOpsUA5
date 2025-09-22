helm repo add eks https://aws.github.io/eks-charts
helm repo update


helm upgrade --install aws-load-balancer-controller eks/aws-load-balancer-controller \
  -n kube-system \
  --set clusterName=ca-devopsua5 \
  --set serviceAccount.create=false \
  --set serviceAccount.name=aws-load-balancer-controller
