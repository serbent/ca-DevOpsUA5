#!/bin/bash

# Resource group and VM configuration
RESOURCE_GROUP="DevOpsUA5-vm-rg"
VM_NAME="DevOpsUA5-vm"
REGION="eastus"
SIZE="Standard_B1s"
IMAGE="Ubuntu2404"
ADMIN_USER="azureuser"
KEY_NAME="${VM_NAME}_id_rsa"
# Create SSH key pair if not exists
if [ ! -f "$KEY_NAME" ]; then
  ssh-keygen -t rsa -b 2048 -f "$KEY_NAME" -N ""
fi
# Create virtual network and subnet
az network vnet create \
  --resource-group "$RESOURCE_GROUP" \
  --name "${VM_NAME}-vnet" \
  --subnet-name "${VM_NAME}-subnet"
# Create network security group and allow SSH and HTTP/HTTPS
az network nsg create \
  --resource-group "$RESOURCE_GROUP" \
  --name "${VM_NAME}-nsg"
az network nsg rule create \
  --resource-group "$RESOURCE_GROUP" \
  --nsg-name "${VM_NAME}-nsg" \
  --name Allow-SSH \
  --protocol tcp \
  --priority 1000 \
  --destination-port-range 22 \
  --access allow
az network nsg rule create \
  --resource-group "$RESOURCE_GROUP" \
  --nsg-name "${VM_NAME}-nsg" \
  --name Allow-HTTP \
  --protocol tcp \
  --priority 1001 \
  --destination-port-range 80 \
  --access allow
az network nsg rule create \
  --resource-group "$RESOURCE_GROUP" \
  --nsg-name "${VM_NAME}-nsg" \
  --name Allow-HTTPS \
  --protocol tcp \
  --priority 1002 \
  --destination-port-range 443 \
  --access allow
# Create public IP
az network public-ip create \
  --resource-group "$RESOURCE_GROUP" \
  --name "${VM_NAME}-ip"
# Create NIC
az network nic create \
  --resource-group "$RESOURCE_GROUP" \
  --name "${VM_NAME}-nic" \
  --vnet-name "${VM_NAME}-vnet" \
  --subnet "${VM_NAME}-subnet" \
  --network-security-group "${VM_NAME}-nsg" \
  --public-ip-address "${VM_NAME}-ip"
# Create VM
az vm create \
  --resource-group "$RESOURCE_GROUP" \
  --name "$VM_NAME" \
  --nics "${VM_NAME}-nic" \
  --image "$IMAGE" \
  --size "$SIZE" \
  --admin-username "$ADMIN_USER" \
  --ssh-key-value "$KEY_NAME.pub" \
  --no-wait
# Output VM details
az vm show \
  --resource-group "$RESOURCE_GROUP" \
  --name "$VM_NAME" \
  --show-details \
  --output table
# Output SSH command
echo "To connect to the VM, use the following command:"
echo "ssh -i $KEY_NAME $ADMIN_USER@$(az vm show --resource-group $RESOURCE_GROUP --name $VM_NAME --query publicIpAddress -o tsv)"
# Output completion message
echo "VM $VM_NAME created in $REGION with size $SIZE."