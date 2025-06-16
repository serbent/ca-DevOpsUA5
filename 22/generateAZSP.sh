#!/bin/bash

SUBSCRIPTION_ID=$(az account show --query id -o tsv)
RESOURCE_GROUP="DevOpsUA5-azsp-rg"
az ad sp create-for-rbac \
  --name "DevOpsUA5-azsp" \
  --role contributor \
  --scopes /subscriptions/$SUBSCRIPTION_ID/resourceGroups/$RESOURCE_GROUP \
  --sdk-auth > ~/azsp.json