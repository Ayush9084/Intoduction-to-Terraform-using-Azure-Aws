terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.50.0"
    }
  }
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.50.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "***********************"
  client_id       = "*************************"
  client_secret   = "***************************"
  tenant_id       = "**************************"
  features {

  }

}

  resource "azurerm_resource_group" "myrg" {
  name     = "myrg"
  location = "East US"
}

// Script using dependencies_on to ensure resource creation order //

resource "azurerm_storage_account" "dsk077" {
  name                     = "dsk077"
  resource_group_name      = "myrg"
  location                 = "East US"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  depends_on = [ azurerm_resource_group.myrg ]  // Ensures resource group is created first //

}

resource "azurerm_storage_container" "container077" {
  name                  = "container077"
  storage_account_id    = "/subscriptions/ede7f38c-5cfc-4658-b28b-f048a4f9dad6/resourceGroups/myrg/providers/Microsoft.Storage/storageAccounts/dsk077"
  container_access_type = "blob"
  depends_on = [ azurerm_storage_account.dsk077 ]  // Ensures storage account is created first //
}

resource "azurerm_storage_blob" "blob077" {
  name                   = "myfile"
  storage_account_name   = "dsk077"
  storage_container_name = "container077"
  type                   = "Block"
  source                 = "main.tf"
  depends_on = [ azurerm_storage_container.container077 ]  // Ensures storage container is created first //
}