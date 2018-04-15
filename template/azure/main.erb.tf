resource "azurerm_resource_group" "resource_group" {
  name     = "${var.cluster_name}"
  location = "${var.region}"

  tags {
    Source = "Kubernetes the Easy Way for Azure"
  }
}

resource "azurerm_kubernetes_cluster" "cluster" {
  name                   = "${var.resource_group_name != "" ? var.resource_group_name : var.cluster_name}"
  location               = "${azurerm_resource_group.resource_group.location}"
  resource_group_name    = "${azurerm_resource_group.resource_group.name}"
  dns_prefix             = "${var.cluster_name}"  

  linux_profile {
    admin_username = "${var.cluster_username}"

    ssh_key {
      key_data = "${file(var.linux_admin_ssh_publickey)}"
    }
  }

  agent_pool_profile {
    name       = "agentpools"
    count      = "${var.linux_agent_count}"
    vm_size    = "${var.linux_agent_vm_size}"
  }

  service_principal {
    client_id     = "${var.service_principal_client_id}"
    client_secret = "${var.service_principal_client_secret}"
  }

  tags {
    Source = "Azure Quickstarts for Terraform"
    Environment = "Development"
  }

}
