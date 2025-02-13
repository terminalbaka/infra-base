# Resource Group
resource "azurerm_resource_group" "main" {
  name     = "intelligence"
  location = var.location_eastus
}

resource "azurerm_postgresql_flexible_server" "main" {
  name                = var.postgres_server_name
  location            = var.location_eastus2
  resource_group_name = azurerm_resource_group.main.name

  administrator_login    = var.postgres_admin_username
  administrator_password = var.postgres_admin_password

  sku_name = var.postgres_sku_name
  version  = var.postgres_version
  storage_mb = var.postgres_storage_mb

  backup_retention_days = 7
  geo_redundant_backup_enabled = true
  auto_grow_enabled           = true

  public_network_access_enabled    = true

  depends_on = [azurerm_resource_group.main]
}

resource "azurerm_postgresql_flexible_server_firewall_rule" "my_ip" {
  name                = "allow-my-ip"
  server_id = azurerm_postgresql_flexible_server.main.id
  start_ip_address    = var.my_ip_address
  end_ip_address      = var.my_ip_address

  depends_on = [
    azurerm_postgresql_flexible_server.main
  ]
}