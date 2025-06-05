provider "proxmox" {
  endpoint = var.proxmox_api_url
  api_token = var.proxmox_api_token_secret
  insecure = true
}
