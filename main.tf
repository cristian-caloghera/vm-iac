terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.78.1"
    }
  }
}

module "k_control" {
  source  = "./modules/vm"

  prefix = "k-control-"

  tally = 1

  tags = [
    "k",
    "control"
  ]

  sockets = 2
  cores = 2
  memory = 16384
  disk_size = 128

  private_key = var.proxmox_vm_private_key
}

module "k_worker" {
  source = "./modules/vm"

  prefix = "k-worker-"

  tally = 3

  tags = [
    "k",
    "worker"
  ]

  sockets = 4
  cores = 3
  memory = 65536
  disk_size = 256

  private_key = var.proxmox_vm_private_key
}
