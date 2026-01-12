locals {
  ansible_vms = {
    for name, vm in proxmox_vm_qemu.vm :
    name => {
      ip = vm.default_ipv4_address
    }
  }
}

resource "local_file" "ansible_inventory" {
  filename = "${path.module}/../ansible/inventory/terraform/hosts"

  content = templatefile("${path.module}/template/inventory.tmpl", {
    vms = local.ansible_vms
  })
}