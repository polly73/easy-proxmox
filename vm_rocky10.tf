resource "proxmox_vm_qemu" vm_name {
        count   = length(local.all_vms)
        name = local.all_vms[count.index].vm_name
        memory = local.all_vms[count.index].vm_memory
        balloon = local.all_vms[count.index].vm_memory/2
        desc = "${var.vm_name} Prod VM"
        cpu{
        cores = local.all_vms[count.index].vm_cpu
        sockets = 1
        type = "x86-64-v3"
        } 
        target_node = "virt1"
        sshkeys = "ssh-rsa "
        agent = 1
        #clone = "rocky10"
        clone = local.all_vms[count.index].vm_os
        qemu_os = "l26"
        bios = "ovmf"
        scsihw = "virtio-scsi-pci"
        vga { 
            type = "std" 
            }
disks       {
  scsi      {
     scsi0  {
      disk  {
            size = local.all_vms[count.index].vm_diskspace
            storage = "local-zfs"
            }
            }
            } 
   ide    {
     ide2 {
          cloudinit {
                    storage = "local-zfs"
                    }
          } 
          }
          }

network { 
        bridge = local.all_vms[count.index].vm_net
        model = "virtio"
        id = 0
        }
## muss dem Template matchen
  os_type = "cloud-init"
  ipconfig0 = "ip=dhcp,ip6=dhcp"
  nameserver = "192.168.1.1"
  ciuser = "polly"
}



