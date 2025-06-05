variable "proxmox_vm_private_key" {
  description = "a private SSH to access the machines"
  type = string
  sensitive = true
}

variable "proxmox_api_url" {
  type = string
}

variable "proxmox_api_token_secret" {
  type =  string
  sensitive = true
}

