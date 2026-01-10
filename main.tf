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

# Configure Azure storage backend
terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "tfstatestoragen"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}


# Create the very first management group
resource "azurerm_management_group" "papliba_mg" {
    name = "papliba-test"
    display_name = "papliba_mg"
    //name = "papliba-test" 
  
}

# Create the platform management group
resource "azurerm_management_group" "platform_mg" {
    name = "papliba-platform"
    display_name = "Platform"
    //name = "papliba-test" 
    parent_management_group_id = azurerm_management_group.papliba_mg.id
  
}
# Create the landing zone management group
resource "azurerm_management_group" "landing_zone_mg" {
    name = "papliba-landing-zone"
    display_name = "Landing Zone"
    //name = "papliba-test" 
    parent_management_group_id = azurerm_management_group.papliba_mg.id
  
}
# Create the decommissioned management group
resource "azurerm_management_group" "decommissioned_mg" {
    name = "papliba-decommissioned"
    display_name = "Decommissioned"
    //name = "papliba-test" 
    parent_management_group_id = azurerm_management_group.papliba_mg.id
  
}
# Create the sandbox management group
resource "azurerm_management_group" "sandbox_mg" {
    name = "papliba-sandbox"
    display_name = "Sandbox"
    //name = "papliba-test" 
    parent_management_group_id = azurerm_management_group.papliba_mg.id
  
}

# Create the security management group
resource "azurerm_management_group" "security_mg" {
    name = "papliba-security"
    display_name = "Security"
    //name = "papliba-test" 
    parent_management_group_id = azurerm_management_group.platform_mg.id
  
}

# Create the management management group
resource "azurerm_management_group" "management_mg" {
    name = "papliba-management"
    display_name = "Management"
    //name = "papliba-test" 
    parent_management_group_id = azurerm_management_group.platform_mg.id
  
}

# Create the identity management group
resource "azurerm_management_group" "identity_mg" {
    name = "papliba-identity"
    display_name = "Identity"
    //name = "papliba-test" 
    parent_management_group_id = azurerm_management_group.platform_mg.id
  
}

# Create the connectivity management group
resource "azurerm_management_group" "connectivity_mg" {
    name = "papliba-connectivity"
    display_name = "Connectivity"
    //name = "papliba-test" 
    parent_management_group_id = azurerm_management_group.platform_mg.id
  
}
# Create the corp management group
resource "azurerm_management_group" "corp_mg" {
    name = "papliba-corp"
    display_name = "Corp"
    //name = "papliba-test" 
    parent_management_group_id = azurerm_management_group.landing_zone_mg.id
  
}
# Create the online management group
resource "azurerm_management_group" "online_mg" {
    name = "papliba-online"
    display_name = "Online"
    //name = "papliba-test" 
    parent_management_group_id = azurerm_management_group.landing_zone_mg.id
  
}