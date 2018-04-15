output "master_fqdn" {
  value = "${azurerm_kubernetes_cluster.cluster.fqdn}"

}

output "cluster_fqn" {
    value = "${azurerm_kubernetes_cluster.cluster.fqdn}"
}

output "ssh_command" {
  value = "ssh ${var.cluster_username}@${azurerm_kubernetes_cluster.cluster.fqdn} -A -p 22"
}