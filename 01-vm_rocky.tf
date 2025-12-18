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
  sshkeys     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDBOZRxg+nv2gzp3Rdpyrfx7LcJUp89TnpX5O416pd8yurfvIgMqD2D7LS5sx8i2n/XKhvOuupERw66uNXaSBV38vHrNEPdx3AYSJk+rcImwKXOGj0bOWKzmgrVsgrivR8v6/GqhWca1p9U7Vv0vm7k2jb758M/aZzUF98+NgtgJMJqtHEZXAcDI3je3AtMa6c4yN2jr+GbBjckhzKBPoLj+nU9WeVH9yXP/9nXpIIAV0b7ybVPSCTiR7WxRqUiksKNEVvh+/6xIUNnfutOAIxfh0iamDazQxFVNZ/oqu1fFJehbx9XnPTCIvnZmAQqgZKIIR2UsFa0jyPy66+pD6uDQnftlqqakfyiPmejse1RR+lbT/GoPFviaB0vJnkW+eHSymsh6I9TbrD+6jBuLJ0Qt4g7LQwPRNXCTA4EOVeEuZpQSCFJ91WwCpeYfd/aomhZlN2q8d8Ci18BA77mcbPlmhUOxZPZdzl6DnpRBzLMOMDA0axKvadmU/hO75mnmZc="
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
}



