resource "netbox_virtual_machine" "vm" {
  for_each = proxmox_vm_qemu.vm

  name       = each.value.name
  site_id    = var.netbox_site_id
  role_id    = var.netbox_role_id
  cluster_id = var.netbox_cluster_id
}

resource "netbox_interface" "vm_if" {
  for_each           = proxmox_vm_qemu.vm
  name               = "eth0"
  virtual_machine_id = netbox_virtual_machine.vm[each.key].id
  mac_address        = each.value.network[0].macaddr
}

resource "netbox_ip_address" "vm_ip" {
  for_each                     = proxmox_vm_qemu.vm
  ip_address                   = "${each.value.default_ipv4_address}/24"
  status                       = "active"
  virtual_machine_interface_id = netbox_interface.vm_if[each.key].id
}

