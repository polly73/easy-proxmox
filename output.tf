output "proxmox_ip4_address" {
  description = "Current IPv4"
  value       = [for vm in proxmox_vm_qemu.vm_name : vm.default_ipv4_address]
}

output "proxmox_ip6_address" {
  description = "Current IPv6"
  value       = [for vm in proxmox_vm_qemu.vm_name : vm.default_ipv6_address]
}

output "proxmox_name" {
   description = "Current VM-Name"
  value = [for vm in proxmox_vm_qemu.vm_name : vm.name] 
}

output "mac_addresses" {
   description = "Current VM-MAC"  
  value = [for i in proxmox_vm_qemu.vm_name : i.network[0].macaddr]
}
