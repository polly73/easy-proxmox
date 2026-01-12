resource "netbox_virtual_machine" "vm" {
  for_each = proxmox_vm_qemu.vm
#  for_each = local.vms_by_name
  name       = each.value.name
  site_id    = var.netbox_site_id
  role_id    = var.netbox_role_id
  cluster_id = var.netbox_cluster_id
}

resource "netbox_interface" "vm_if" {
  for_each           = proxmox_vm_qemu.vm
  name               = "eth0"
  virtual_machine_id = netbox_virtual_machine.vm[each.key].id
  type                = "virtual"
  mac_address        = each.value.network[0].macaddr
}

resource "netbox_ip_address" "vm_ip" {
  for_each                     = proxmox_vm_qemu.vm
  ip_address                   = "${each.value.default_ipv4_address}/24"
  status                       = "active"
  virtual_machine_interface_id = netbox_interface.vm_if[each.key].id
}  

resource "netbox_primary_ip" "vm_primary_ip" {
  for_each          = local.vms_by_name  # Gleicher Key wie IPs!
  ip_address_id     = netbox_ip_address.vm_ip[each.key].id
  virtual_machine_id = netbox_virtual_machine.vm[each.key].id  # ← RESOURCE!
}

resource "netbox_virtual_disk" "vm_disk" {
  for_each           = local.vms_by_name  
  name               = "${each.value.vm_name}-disk0"  # each.value aus YAML
  size_mb            = tonumber(split("G", each.value.vm_diskspace)[0]) * 1024
  virtual_machine_id = netbox_virtual_machine.vm[each.key].id 
  description = "Main disk ${each.value.vm_diskspace} OS: ${each.value.vm_os}, CPU: ${each.value.vm_cpu}, RAM: ${each.value.vm_memory}MB"
}  



# # Deine bestehenden VMs aus Proxmox auslesen
# data "proxmox_vm_qemu" "existing_vms" {
#   for_each = toset(["vm1", "vm2"])  # VM-Namen
#   vmid     = proxmox_vm_qemu.vm[each.key].vmid
#   node_name = "virt1"
# }

# # In NetBox als VM-Objekt
# resource "netbox_virtual_machine" "proxmox_vms" {
#   for_each = data.proxmox_vm_qemu.existing_vms
  
#   name        = each.value.name
#   status      = each.value.status == "running" ? "active" : "offline"
#   vcpus       = each.value.cores
#   memory      = each.value.memory
#   cluster_id  = var.netbox_cluster_id
  
#   custom_fields = {
#     proxmox_vmid = each.value.vmid
#     proxmox_node = each.value.node_name
#   }
# }

