# Specifiy the provider and version
terraform {
    required_providers {
        azurerm = {
            source  = "hashicorp/azurerm"
            version = "~> 4.0"
        }
    }

}

# Configure the Microsoft Azure Provider
provider "azurerm" {
    features {}
    subscription_id = "26aa5846-d34c-410e-a041-1bfe17406a4e"
}   

# Create the very first management group
resource "azurerm_management_group" "papliba_mg" {
    display_name = "papliba_mg"
    name = "papliba-test" 
  
}
