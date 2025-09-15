```bash
eksctl utils associate-iam-oidc-provider --cluster $CLUSTER_NAME --approve
```


```bash
wget -O alb-ingress-iam-policy.json https://raw.githubusercontent.com/kubernetes-sigs/aws-alb-ingress-controller/master/docs/examples/iam-policy.json
aws iam create-policy --policy-name ALBIngressControllerIAMPolicy --policy-document file://alb-ingress-iam-policy.json
```
```bash
STACK_NAME=eksctl-$CLUSTER_NAME-cluster
VPC_ID=$(aws cloudformation describe-stacks --stack-name "$STACK_NAME" | jq -r '[.Stacks[0].Outputs[] | {key: .OutputKey, value: .OutputValue}] | from_entries' | jq -r '.VPC')
AWS_ACCOUNT_ID=$(aws sts get-caller-identity | jq -r '.Account')
```