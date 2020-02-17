resource "digitalocean_droplet" "master" {
    count = var.master_node_count
    name = "${var.do_master_name}${count.index + 1}"
    image = var.do_image
    size = var.master_compute_size
    region = var.do_region

    ssh_keys = [var.do_ssh_key]
}