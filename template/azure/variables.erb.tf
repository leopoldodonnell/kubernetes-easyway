variable "cluster_name" {
  default = "terraform-example-cluster"
}

variable "resource_group_name" {
  type        = "string"
  default     = ""
  description = "Name of the azure resource group. When blank defaults to cluster_name"
}

variable "region" {
  type        = "string"
  description = "Location of the azure resource group."
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

variable "cluster_username" { 
  type    = "string"
  default = "cluster_admin" 
  description = "User name for authentication to the Kubernetes linux agent virtual machines in the cluster."
}

variable "linux_admin_ssh_publickey" {
  type        = "string"
  description = "Configure all the linux virtual machines in the cluster with the SSH RSA public key string. The key should include three parts, for example 'ssh-rsa AAAAB...snip...UcyupgH azureuser@linuxvm'"
}

variable "service_principal_client_id" {
  type        = "string"
  default     = "<%= provider['client_id'] %>"
  description = "The client id of the azure service principal used by Kubernetes to interact with Azure APIs."
}

#Note: All arguments including the client secret will be stored in the raw state as plain-text. Read more about sensitive data in state at https://www.terraform.io/docs/providers/azurerm/r/container_service.html
variable "service_principal_client_secret" {
  type        = "string"
  default     = "<%= provider['client_secret'] %>"
  description = "The client secret of the azure service principal used by Kubernetes to interact with Azure APIs."
}