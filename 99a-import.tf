#Resource anlegen vor dem import
#resource "proxmox_vm_qemu" "vm" {}

# impoort einer VM aus Proxmox in den state
#terraform import proxmox_vm_qemu.example [node]/[type]/[vmId]

#löschen einer VM aus dem state 
#terraform state rm proxmox_vm_qemu.test-srv01