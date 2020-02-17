resource "digitalocean_domain" "master_domain" {
    count = var.do_dns_enabled ? var.master_node_count : 0
    name = "${digitalocean_droplet.master[count.index].name}.${var.do_domain_name}"
    ip_address = digitalocean_droplet.master[count.index].ipv4_address
}

resource "digitalocean_domain" "worker_domain" {
    count = var.do_dns_enabled ? var.worker_node_count : 0
    name = "${digitalocean_droplet.worker[count.index].name}.${var.do_domain_name}"
    ip_address = digitalocean_droplet.worker[count.index].ipv4_address
}