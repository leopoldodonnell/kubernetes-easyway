<%
    module_dir = module_repo || "../../modules"

    if module_branch.nil? || module_branch == ''
        branch = ''
    else
        branch = "?ref=#{module_branch}"
    end
%>

variable "region" {}

variable "cluster_username" { default = "admin" }

provider "random" {
    version = "~> 1.1"
}

resource "random_string" "cluster_password" {
    length = 16
    special = true
}

module "cluster-builder" {
    source      = "<%= "#{module_dir}/cluster/#{kind}#{branch}" %>"
    region      = "${var.region}"
    username    = "${var.cluster_username}"
    password    = "${random_string.cluster_password.result}"
}

output "cluster_user" {
    value = "${var.cluster_username}"
}

output "cluster_password" {
    value = "${random_string.cluster_password.result}"
}
