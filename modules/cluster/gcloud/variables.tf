variable "region" {}

variable "cluster_name" {
  default = "terraform-example-cluster"
}
variable "kubernetes_version" {
  default = "1.8.8"
}
variable "username" {}
variable "password" {}
