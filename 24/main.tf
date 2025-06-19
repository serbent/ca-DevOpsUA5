terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.33.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "d70ff514-57bb-4510-97db-d61cde90fc4f"
  features {
    resource_group {
      prevent_deletion_if_contains_resources = true
    }
  }
}

resource "azurerm_resource_group" "ca-DevOpsUA5" {
  name     =  "ca-terra-DevOpsUA5-rg"
  location = "eastus"
}

resource "azurerm_network_security_group" "ca-DevOpsUA5-nsg" {
  name                = "ca-terra-DevOpsUA5-group"
  location            = azurerm_resource_group.ca-DevOpsUA5.location
  resource_group_name = azurerm_resource_group.ca-DevOpsUA5.name

  security_rule {
    name                       = "SSH-Access"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_virtual_network" "ca-DevOpsUA5-network" {
  name                = "ca-DevOpsUA5-network"
  location            = azurerm_resource_group.ca-DevOpsUA5.location
  resource_group_name = azurerm_resource_group.ca-DevOpsUA5.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]
# subnet = azurerm_subnet.ca-DevOpsUA5-internal-subnet.name
  tags = {
    environment = "Production"
  }
}


resource "azurerm_network_interface" "ca-devopsua5-nic" {
  name                = "ca-devopsua5-nic"
  location            =  azurerm_resource_group.ca-DevOpsUA5.location
  resource_group_name =  azurerm_resource_group.ca-DevOpsUA5.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     =  azurerm_subnet.ca-DevOpsUA5-internal-subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "ca-devopsua5-vm" {
    name                = "ca-devopsua5-vm"
    resource_group_name = azurerm_resource_group.ca-DevOpsUA5.name
    location            = azurerm_resource_group.ca-DevOpsUA5.location
    size                = "Standard_B1s"
    admin_username      = "adminuser"
    network_interface_ids = [
    azurerm_network_interface.ca-devopsua5-nic.id,
    ]

    admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/id_ed25519.pub")
    }

    os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    }

    source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
    }
}


    resource "azurerm_subnet" "ca-DevOpsUA5-internal-subnet" {
      name                 = "ca-DevOpsUA5-internal-subnet"
      resource_group_name  = azurerm_resource_group.ca-DevOpsUA5.name
      virtual_network_name = azurerm_virtual_network.ca-DevOpsUA5-network.name
      address_prefixes     = ["10.0.5.0/24"]
    }