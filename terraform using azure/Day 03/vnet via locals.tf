// create vnet via locals //


terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.50.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "ede7f38c-5cfc-4658-b28b-f048a4f9dad6"
  client_id       = "be366ca2-4991-4707-8bee-6781296e7cb6"
  client_secret   = "kwi8Q~BNyn~i76TiSJUpnLL6BN.UJzOqHQex2c8Q"
  tenant_id       = "26b8e668-1aad-4fd7-bf87-22fe43158224"
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

  subnet {
    name             = local.subnets[0].name
    address_prefixes = local.subnets[0].address_prefix
  
  }

  subnet {
    name             = local.subnets[1].name
    address_prefixes = local.subnets[1].address_prefix
  }

  depends_on = [ azurerm_resource_group.rg ]
}