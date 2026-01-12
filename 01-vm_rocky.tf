resource "proxmox_vm_qemu" "vm" {
  for_each = local.vms_by_name

  name        = each.value.vm_name
  vmid        = random_integer.vm_id[each.key].result
  memory      = each.value.vm_memory
  balloon     = each.value.vm_memory / 2
  description = "${each.value.vm_name} Prod VM"
  cpu {
    cores   = each.value.vm_cpu
    sockets = 1
    type    = each.value.vm_cpu_type
  }
  # target_node = "virt1"
  target_node = each.value.vm_host
  sshkeys     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILm3RcOfhuWlfw+8WpHQv4J7wbNJLcADTpJ4Z9fsbDoi polly@xillent.name"
  agent       = 1
  #clone = "rocky10"
  clone   = each.value.vm_os
  qemu_os = "l26"
  bios    = "ovmf"
  scsihw  = "virtio-scsi-pci"
  vga {
    type = "std"
  }
  disks {
    scsi {
      scsi0 {
        disk {
          size    = each.value.vm_diskspace
          storage = "local-zfs"
        }
      }
    }
    ide {
      ide2 {
        cloudinit {
          storage = "local-zfs"
        }
      }
    }
  }

  network {
    bridge = each.value.vm_net
    model  = "virtio"
    id     = 0
  }
  ## muss dem Template matchen
  os_type    = "cloud-init"
  ipconfig0  = "ip=dhcp,ip6=dhcp"
  nameserver = "192.168.1.1"
  ciuser     = "polly"
  searchdomain = "home.tinytip.de"
}



