// creating virtual machine //

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.50.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "************************************************"
  client_id       = "************************************************"
  client_secret   = "************************************************"
  tenant_id       = "************************************************"
  features {
  }
}

locals {
  resource_group_name = "myrg"
  location = "central india"
  virtual_network = {
    name = "vnet01"
    address_space = ["10.0.0.0/16"]
  }

  subnets = [
    {
      name = "subnet01"
      address_prefix = ["10.0.1.0/24"]
    },
    {
      name = "subnet02"
      address_prefix = ["10.0.2.0/24"]
    }
  ]
}

resource "azurerm_resource_group" "rg" {
  name     = local.resource_group_name
  location = local.location
}

resource "azurerm_virtual_network" "vnet" {
  name                = local.virtual_network.name
  location            = local.location
  resource_group_name = local.resource_group_name
  address_space       = local.virtual_network.address_space

  depends_on = [ azurerm_resource_group.rg ]
}

resource "azurerm_subnet" "subnet01" {
  name                 = local.subnets[0].name
  resource_group_name  = local.resource_group_name
  virtual_network_name = local.virtual_network.name
  address_prefixes     = local.subnets[0].address_prefix
  depends_on = [ azurerm_virtual_network.vnet ]
}

resource "azurerm_subnet" "subnet02" {
  name                 = local.subnets[1].name
  resource_group_name  = local.resource_group_name
  virtual_network_name = local.virtual_network.name
  address_prefixes     = local.subnets[1].address_prefix
  depends_on = [ azurerm_virtual_network.vnet ]
}

resource "azurerm_network_interface" "nic" {
  name                = "nic01"
  location            = local.location
  resource_group_name = local.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet01.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.ip.id              // mention public ip block //
  }
  depends_on = [ azurerm_subnet.subnet01 ]
}

resource "azurerm_public_ip" "ip" {
  name                = "myip"
  resource_group_name = local.resource_group_name
  location            = local.location                      // create public ip //
  allocation_method   = "Static"

depends_on = [ azurerm_resource_group.rg ]
}

output "IPADDRESS" {
  value = azurerm_public_ip.ip.ip_address
}


resource "azurerm_network_security_group" "nsg01" {
  name                = "mynsg01"
  location            = local.location
  resource_group_name = local.resource_group_name

  security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
depends_on = [ azurerm_resource_group.rg ]
}

resource "azurerm_subnet_network_security_group_association" "association01" {
  subnet_id                 = azurerm_subnet.subnet01.id
  network_security_group_id = azurerm_network_security_group.nsg01.id
}

resource "azurerm_windows_virtual_machine" "vm" {
  name                = "vm01"
  resource_group_name = local.resource_group_name
  location            = local.location
  size                = "Standard_D2s_v3"
  admin_username      = "adminuser"
  admin_password      = "P@$$w0rd1234!"
  network_interface_ids = [
    azurerm_network_interface.nic.id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
  depends_on = [ azurerm_network_interface.nic, azurerm_resource_group.rg ]
}