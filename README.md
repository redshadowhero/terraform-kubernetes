# Kubespray deployment on DigitalOcean

Mostly set up to show how to use terraform and ansible to provision out kubernetes

# Prerequsites

* git
* Python (3.x) with pip
* [Terraform](https://www.terraform.io/downloads.html)
* A [DigitalOcean](https://www.digitalocean.com/) account with a generated API key and set ssh key
* (Optional) `doctl`, since it allows you to quickly determine your ssh key with `doctl compute ssh-key list`

# Setup

After cloning this repo, setup is somewhat straightforward:

1. `terraform init`
2. `pip install -r requirements.txt`
3. `git submodule init && git submodule update`
4. `cp config.tfvars{.examples,}` and edit `config.tfvars` to match your environment – at a minimum, you should set your `do_token` and `do_ssh_key`; everything else is optional
5. `terraform apply -var-file=config.tfvars`
6. `ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i ./vendor/terraform-inventory/terraform.py --user=root --become --become-user=root --private-key ${PATH_TO_SSH_KEY} vendor/kubespray/cluster.yml` (making sure to change `${PATH_TO_SSH_KEY}`)