# main.tf

# 1. สร้าง Azure Resource Group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# 2. สร้าง Network Security Group (NSG)
resource "azurerm_network_security_group" "example_nsg" {
  name                = "iac-devsecops-nsg"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

# 3. สร้างกฎความปลอดภัย (Security Rule) ที่มีช่องโหว่ (Vulnerability)
# โค้ดนี้อนุญาต SSH (พอร์ต 22) จาก IP ใดๆ บนอินเทอร์เน็ต (*)
resource "azurerm_network_security_rule" "insecure_ssh" {
  name                        = "Allow-SSH-Public"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "172.190.231.235/32" # <--- ช่องโหว่: เปิดสู่สาธารณะ!
  destination_address_prefix  = "*"
  network_security_group_name = azurerm_network_security_group.example_nsg.name
  resource_group_name         = azurerm_resource_group.rg.name
}