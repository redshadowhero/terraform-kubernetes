provider "digitalocean" {
    token = var.do_token
}

resource "digitalocean_project" "kube-project" {
    name = var.do_project
    
    resources = concat(digitalocean_droplet.master.*.urn, digitalocean_droplet.worker.*.urn, digitalocean_domain.master_domain.*.urn, digitalocean_domain.worker_domain.*.urn)
}