terraform {
    required_providers {
        azurerm = {
            source = "hashicorp/azurerm"
                version = "3.53.0"
        }
    }
}

provider "azurerm" {
    subscription_id = var.subscription_id
    client_id = var.client_id
    client_secret = var.tenant_id
    tenant_id = var.tenantID
    features {}
}

resource "azurerm_resource_group" "rg" {
    name     = "educacionit-devops-rg"
    location = "eastus"
}