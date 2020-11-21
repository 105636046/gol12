provider "azurerm" {

  features {

  }

}

resource "azurerm_resource_group" "rg" {

  location = "eastus"
  name     = "rg"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "vnet"
  location            = "eastus"
  address_space       = ["10.0.0.0/24"]
  resource_group_name = azurerm_resource_group.rg.name

}
resource "azurerm_subnet" "subnet" {
  name                 = "subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.0.0/28"]
}
resource "azurerm_public_ip" "ip" {
  name                = "ip"
  location            = "eastus"
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Dynamic"

}

resource "azurerm_network_security_group" "nsg" {

  name                = "nsg"
  location            = "eastus"
  resource_group_name = azurerm_resource_group.rg.name

 security_rule {
        name                       = "SSH"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }

}

resource "azurerm_network_interface" "nic" {
  name                = "nic"
  location            = "eastus"
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "ip"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.ip.id

  }
}
resource "azurerm_network_interface_security_group_association" "nsc" {
  network_interface_id      = azurerm_network_interface.nic.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

resource "azurerm_storage_account" "sac2" {
  name                     = "sac2"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = "eastus"
  account_replication_type = "LRS"
  account_tier             = "Standard"
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                  = "vm"
  location              = "eastus"
  resource_group_name   = azurerm_resource_group.rg.name
  network_interface_ids = [azurerm_network_interface.nic.id]
  size                  = "Standard_DS1_v2"
  os_disk {
    name                 = "myOsDisk"
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  computer_name  = "myvm"
  admin_username = "azureuser"
  admin_password = "india@123456"
  disable_password_authentication = false



}
