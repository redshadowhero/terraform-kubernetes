variable "do_token" {
    type = string
    description = "DigitalOcean token"
}

variable "do_ssh_key" {
    type = number
    description = "The ssh key id to use to access the droplets – you can use the doctl client to find them with `doctl compute ssh-key list'"
}

variable "do_image" {
    type = string
    description = "DigitalOcean image"
    default = "centos-7-x64"
}

variable "master_compute_size" {
    type = string
    description = "DigitalOcean compute image size for master nodes"
    default = "s-2vcpu-2gb" # $15/month
}

variable "worker_compute_size" {
    type = string
    description = "DitalOcean compute image size for worker nodes"
    default = "s-2vcpu-2gb" # $15/month
}

variable "master_node_count" {
    type = number
    description = "Number of master nodes"
    default = 3
}

variable "do_master_name" {
    type = string
    description = "Name of the kube master node; will be suffixed with a number, starting at 1"
    default = "kube-master"
}

variable "do_worker_name" {
    type = string
    description = "Name of the kube worker node; will be suffixed with a number, starting at 1"
    default = "kube-worker"
}

variable "worker_node_count" {
    type = number
    description = "Number of worker nodes"
    default = 2
}

variable "do_region" {
    type = string
    description = "DigitalOcean region to launch in"
    default = "nyc1"
}

variable "do_project" {
    type = string
    description = "Project to encapsulate terraform'd resources under"
    default = "kubespray"
}

variable "do_dns_enabled" {
    type = bool
    description = "Whether to enable DNS mapping or not"
    default = false
}

variable "do_domain_name" {
    type = string
    description = "The domain name to use"
}