terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.78.1"
    }
  }
}

resource "proxmox_virtual_environment_vm" "vm_clone" {
  count = var.tally

  name = "${var.prefix}${count.index}"
  tags = var.tags

  node_name = "play"

  clone {
    vm_id = 1001
    full = true
  }

  agent {
    enabled = true
  }

  started = true

  cpu {
    cores      = var.cores
    sockets    = var.sockets
    numa       = true
    type       = "host"
  }


  memory {
    dedicated = var.memory
    floating  = var.memory # set equal to dedicated to enable ballooning
  }

  disk {
    interface    = "scsi0"
    size         = var.disk_size

    aio          = "io_uring"
    backup       = true
    cache        = "none"
    datastore_id = "local-zfs"
    discard      = "ignore"
    iothread     = true
    replicate    = false
    ssd          = true
  }
}

resource "terraform_data" "vm_reboot" {
  count = var.tally

  input = proxmox_virtual_environment_vm.vm_clone[count.index].ipv4_addresses[1][0]

  connection {
    type     = "ssh"
    user     = "homelab"
    private_key = var.private_key
    host     = proxmox_virtual_environment_vm.vm_clone[count.index].ipv4_addresses[1][0]
  }

  provisioner "remote-exec" {
	    inline = [
      "sudo /usr/sbin/reboot"
    ]
  }
}
