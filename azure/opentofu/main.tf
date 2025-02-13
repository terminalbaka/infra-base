terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "terminalBaka"
    storage_account_name = "terminalbakastate"
    container_name      = "tfstate"
    key                 = "infra.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
} 