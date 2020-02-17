resource "digitalocean_droplet" "worker" {
    count = var.worker_node_count
    name = "${var.do_worker_name}${count.index + 1}"
    image = var.do_image
    size = var.worker_compute_size
    region = var.do_region

    ssh_keys = [var.do_ssh_key]
}