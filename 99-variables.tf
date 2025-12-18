locals {
  # alle YAML-Dateien im vm/-Ordner sammeln
  vm_files = fileset("${path.module}/vm", "*.yaml")

  # alle vms-Listen aus allen Dateien zu einer Liste flatten
  all_vms = flatten([
    for f in local.vm_files :
    yamldecode(file("${path.module}/vm/${f}")).vms
  ])

  # Map bauen: Schlüssel = vm_name, Wert = komplettes VM-Objekt
  vms_by_name = {
    for vm in local.all_vms :
    vm.vm_name => vm
  }
}

resource "random_integer" "vm_id" {
  for_each = local.vms_by_name

  min = 2000 # an deinen gewünschten/erlaubten Bereich anpassen
  max = 2100
}

#####
# Variable für gitlab
#####
variable "gitlab_username" {
  type = string
  description = "gitlab username -> see credentials.auto.tfvars"
}

variable "gitlab_token" {
  type = string
  description = "gitlab token -> see credentials.auto.tfvars"
}



#####
# Variable für Proxmox
#####

variable "proxmox_api_url" {
  type = string
  description = "API URL Proxmox -> see credentials.auto.tfvars"
}

variable "proxmox_api_token_id" {
  type      = string
  sensitive = true
  description = "API Token Proxmox -> see credentials.auto.tfvars"
}

variable "proxmox_api_token_secret" {
  type      = string
  sensitive = true
  description = "API Token Secret Proxmox -> see credentials.auto.tfvars"
}
#####
# Variablen für yaml
#####
variable "vm_name" {
  type    = string
  default = "testvm2"
  description = "VM Name -> see yaml files "
}

variable "vm_cpus" {
  type    = number
  default = "2"
  description = "VM Cores -> see yaml files "  
}

variable "vm_memory" {
  type    = number
  default = "4096"
  description = "VM Memory -> see yaml files "  
}

variable "vm_diskspace" {
  type    = string
  default = "30G"
  description = "VM Diskscape -> see yaml files "  
}

variable "vm_net" {
  type    = string
  default = "lan"
  description = "VM Network Name -> see yaml files "  
}

variable "vm_cpu_type" {
  type    = string
  default = "x86-64-v3"
  description = "VM CPU Type -> see yaml files and compare with OS List and your hardware"  
}

variable "vm_pci_device" {
  type    = bool
  default = false
  description = "VM PCI Device -> see yaml files currently not enabled in 01-vm_rocky.tf, if you do that you have to set variables for all VMs in the yaml files"  
}

variable "vm_raw_id" {
  type    = string
  default = ""
  description = "VM PCI RAW-Device-id -> see yaml files currently not enabled in 01-vm_rocky.tf, if you do that you have to set variables for all VMs in the yaml files"  

}
variable "vm_rombar" {
  type    = bool
  default = false
  description = "VM PCI vm_rombar -> see yaml files currently not enabled in 01-vm_rocky.tf, if you do that you have to set variables for all VMs in the yaml files"  

}
variable "vm_pcie" {
  type    = bool
  default = false
  description = "VM PCIe express -> see yaml files currently not enabled in 01-vm_rocky.tf, if you do that you have to set variables for all VMs in the yaml files"  
  
}
variable "vm_primary_gpu" {
  type    = bool
  default = false
  description = "VM primary GPU -> see yaml files currently not enabled in 01-vm_rocky.tf, if you do that you have to set variables for all VMs in the yaml files"  

}
####
## Netbox Variable
####
variable "netbox_url" {
  type = string
  description = "Netbox URL -> see credentials.auto.tfvars"  

}
variable "netbox_token" {
  type      = string
  sensitive = true
  description = "Netbox token -> see credentials.auto.tfvars"    
}
variable "netbox_site_id" {
  type    = number
  default = 7
  description = "Netbox site ID -> see credentials.auto.tfvars"    
}
variable "netbox_role_id" {
  type    = number
  default = 1
  description = "Netbox role ID -> see credentials.auto.tfvars"    
}
variable "netbox_cluster_id" {
  type    = number
  default = 2
  description = "Netbox cluster id -> see credentials.auto.tfvars"    
} 

