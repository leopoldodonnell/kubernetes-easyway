variable "resource_group_name" {
  type        = "string"
  description = "Name of the azure resource group."
}

variable "region" {
  type        = "string"
  description = "Location of the azure resource group."
}

variable "dns_name_prefix" {
  type        = "string"
  description = "Sets the domain name prefix for the cluster. The suffix 'master' will be added to address the master agents and the suffix 'agent' will be added to address the linux agents."
}

variable "linux_agent_count" {
  type        = "string"
  default     = "1"
  description = "The number of Kubernetes linux agents in the cluster. Allowed values are 1-100 (inclusive). The default value is 1."
}

#complete, up-to-date list of VM sizes can be found at https://docs.microsoft.com/en-us/azure/virtual-machines/linux/sizes
variable "linux_agent_vm_size" {
  type        = "string"
  default     = "Standard_D2_v2"
  description = "The size of the virtual machine used for the Kubernetes linux agents in the cluster."
}

variable "linux_admin_username" {
  type        = "string"
  description = "User name for authentication to the Kubernetes linux agent virtual machines in the cluster."
}

variable "linux_admin_ssh_publickey" {
  type        = "string"
  description = "Configure all the linux virtual machines in the cluster with the SSH RSA public key string. The key should include three parts, for example 'ssh-rsa AAAAB...snip...UcyupgH azureuser@linuxvm'"
}

variable "master_count" {
  type        = "string"
  default     = "1"
  description = "The number of Kubernetes masters for the cluster. Allowed values are 1, 3, and 5. The default value is 1."
}

variable "service_principal_client_id" {
  type        = "string"
  description = "The client id of the azure service principal used by Kubernetes to interact with Azure APIs."
}

#Note: All arguments including the client secret will be stored in the raw state as plain-text. Read more about sensitive data in state at https://www.terraform.io/docs/providers/azurerm/r/container_service.html
variable "service_principal_client_secret" {
  type        = "string"
  description = "The client secret of the azure service principal used by Kubernetes to interact with Azure APIs."
}