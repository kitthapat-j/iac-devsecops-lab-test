# variables.tf

variable "resource_group_name" {
  description = "ชื่อของ Resource Group ที่จะสร้าง"
  type        = string
  default     = "iac-devsecops-rg-1"
}

variable "location" {
  description = "ตำแหน่ง (Region) ของ Azure"
  type        = string
  default     = "East US"
}