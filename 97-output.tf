output "vm_info" {
  description = "Name, IP und VMID aller VMs"
  value = [
    for vm in proxmox_vm_qemu.vm : {
      name = vm.name
      ip   = vm.default_ipv4_address
      mac  = vm.network[0].macaddr
    }
  ]
}