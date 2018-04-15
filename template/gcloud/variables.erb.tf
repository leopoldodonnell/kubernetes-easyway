variable "region" {
  type        = "string"
  description = "Google region for the cluster."
}

variable "cluster_username" { 
  type        = "string"
  default     = "admin" 
  description = "The master auth username"
}

variable "cluster_name" {
  type        = "string"
  default     = "terraform-example-cluster"
  description = "The name for the cluster as a resource"
}

variable "kubernetes_version" {
  type        = "string"
  default     = "1.8.8"
  description = "Version of kubernetes to install in the cluster"
}
