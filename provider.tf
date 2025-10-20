# provider.tf

terraform {
  required_providers {
    # กำหนด provider เป็น Azure (azurerm)
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

# กำหนดค่า provider และเปิดใช้งาน features
provider "azurerm" {
  features {}
  # Terraform จะใช้ Environment Variables (AZURE_CLIENT_ID, ฯลฯ) 
  # ที่เรากำหนดใน Jenkins เพื่อล็อกอินอัตโนมัติ
}