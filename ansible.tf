resource "ansible_host" "master" {
    count = var.master_node_count
    inventory_hostname = "${digitalocean_droplet.master[count.index].name}${var.do_dns_enabled ? format(".%s", var.do_domain_name) : ""}"
    vars = {
        ip = digitalocean_droplet.master[count.index].ipv4_address
        ansible_host = digitalocean_droplet.master[count.index].ipv4_address
    }
    groups = ["kube-master", "etcd"]
}

resource "ansible_host" "worker" {
    count = var.worker_node_count
    inventory_hostname = "${digitalocean_droplet.worker[count.index].name}${var.do_dns_enabled ? format(".%s", var.do_domain_name) : ""}"
    vars = {
        ip = digitalocean_droplet.worker[count.index].ipv4_address
        ansible_host = digitalocean_droplet.worker[count.index].ipv4_address
    }
    groups = ["kube-node"]
}

resource "ansible_group" "k8s-cluster" {
    inventory_group_name = "k8s-cluster"
    children = ["kube-master", "kube-node", "calico-rr"]
}