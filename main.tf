provider "azurerm" {
  # tenant_id       = "${var.tenant_id}"
  # subscription_id = "${var.subscription_id}"
  # client_id       = "${var.client_id}"
  # client_secret   = "${var.client_secret}"
  # The above four are set as env variables
  features {}
}
terraform {
  backend "azurerm" {
    storage_account_name = "tstate12426"
    container_name       = "tstate"
    key                  = "terraform.tfstate"
    # access_key           = ""
    # Set as an env variable
  }
}
module "resource_group" {
  source               = "../../modules/resource_group"
  resource_group       = "${var.resource_group}"
  location             = "${var.location}"
}
# Reference the AppService Module here.
