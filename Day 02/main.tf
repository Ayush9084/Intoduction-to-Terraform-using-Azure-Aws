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

  resource "azurerm_resource_group" "myrg" {
  name     = "myrg"
  location = "East US"
}

// Script using dependencies_on to ensure resource creation order //

resource "azurerm_virtual_network" "vnet" {
  name                = "vnet01"
  location            = "East US"
  resource_group_name = "myrg"
  address_space       = ["10.0.0.0/16"]
  depends_on = [ azurerm_resource_group.myrg ]  // Ensure RG is created first//
}

#   subnet {
#     name             = "subnet1"
#     address_prefixes = ["10.0.1.0/24"]
#   }

#   subnet {
#     name             = "subnet2"
#     address_prefixes = ["10.0.2.0/24"]
#   }
# }

resource "azurerm_subnet" "subnet" {
  name                 = "subnet1"
  resource_group_name  = "myrg"
  virtual_network_name = "vnet01"
  address_prefixes     = ["10.0.1.0/24"]
  depends_on           = [azurerm_virtual_network.vnet]  // Ensure VNet is created first//
}