# Input variable definitions

variable "prefix" {
  description = "A prefix for the name of each instance"
  type = string
  default = "anon"
}

variable "tally" {
  description = "How many VMs"
  type = number
  default = 1
}

variable "tags" {
  description = "Tags to set on the bucket."
  type        = list(string)
  default     = []
}

variable "cores" {
  description = "How many cores per socket CPU"
  type = number
  default = 1
}

variable "sockets" {
  description = "How many CPUs"
  type = number
  default = 1
}

variable "memory" {
  description = "How much RAM in MB"
  type = number
  default = 1024
}

variable "disk_size" {
  description = "How big is the storage space in GB"
  type = number
  default = 8
}

variable "private_key" {
  description = "a private SSH key used to connect and reboot the VM"
  type = string
  sensitive = true
}
