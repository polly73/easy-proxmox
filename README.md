# easy-proxmox

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_local"></a> [local](#requirement\_local) | ~> 2.5 |
| <a name="requirement_netbox"></a> [netbox](#requirement\_netbox) | ~> 4.0 |
| <a name="requirement_proxmox"></a> [proxmox](#requirement\_proxmox) |  3.0.2-rc06 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.6 |
| <a name="requirement_time"></a> [time](#requirement\_time) | 0.9.1 |
| <a name="requirement_utils"></a> [utils](#requirement\_utils) | >= 0.1.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_local"></a> [local](#provider\_local) | 2.6.1 |
| <a name="provider_netbox"></a> [netbox](#provider\_netbox) | 4.3.1 |
| <a name="provider_proxmox"></a> [proxmox](#provider\_proxmox) | 3.0.2-rc06 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.7.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [local_file.ansible_inventory](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [netbox_interface.vm_if](https://registry.terraform.io/providers/e-breuninger/netbox/latest/docs/resources/interface) | resource |
| [netbox_ip_address.vm_ip](https://registry.terraform.io/providers/e-breuninger/netbox/latest/docs/resources/ip_address) | resource |
| [netbox_primary_ip.vm_primary_ip](https://registry.terraform.io/providers/e-breuninger/netbox/latest/docs/resources/primary_ip) | resource |
| [netbox_virtual_disk.vm_disk](https://registry.terraform.io/providers/e-breuninger/netbox/latest/docs/resources/virtual_disk) | resource |
| [netbox_virtual_machine.vm](https://registry.terraform.io/providers/e-breuninger/netbox/latest/docs/resources/virtual_machine) | resource |
| [proxmox_vm_qemu.vm](https://registry.terraform.io/providers/telmate/proxmox/latest/docs/resources/vm_qemu) | resource |
| [random_integer.vm_id](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/integer) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_gitlab-group"></a> [gitlab-group](#input\_gitlab-group) | gitlab group name -> see credentials.auto.tfvars | `string` | n/a | yes |
| <a name="input_gitlab-project-id"></a> [gitlab-project-id](#input\_gitlab-project-id) | gitlab project-id -> see credentials.auto.tfvars | `string` | n/a | yes |
| <a name="input_gitlab-url"></a> [gitlab-url](#input\_gitlab-url) | gitlab tourlken -> see credentials.auto.tfvars | `string` | n/a | yes |
| <a name="input_gitlab_token"></a> [gitlab\_token](#input\_gitlab\_token) | gitlab token -> see credentials.auto.tfvars | `string` | n/a | yes |
| <a name="input_gitlab_username"></a> [gitlab\_username](#input\_gitlab\_username) | gitlab username -> see credentials.auto.tfvars | `string` | n/a | yes |
| <a name="input_netbox_cluster_id"></a> [netbox\_cluster\_id](#input\_netbox\_cluster\_id) | Netbox cluster id -> see credentials.auto.tfvars | `number` | `2` | no |
| <a name="input_netbox_role_id"></a> [netbox\_role\_id](#input\_netbox\_role\_id) | Netbox role ID -> see credentials.auto.tfvars | `number` | `1` | no |
| <a name="input_netbox_site_id"></a> [netbox\_site\_id](#input\_netbox\_site\_id) | Netbox site ID -> see credentials.auto.tfvars | `number` | `7` | no |
| <a name="input_netbox_token"></a> [netbox\_token](#input\_netbox\_token) | Netbox token -> see credentials.auto.tfvars | `string` | n/a | yes |
| <a name="input_netbox_url"></a> [netbox\_url](#input\_netbox\_url) | Netbox URL -> see credentials.auto.tfvars | `string` | n/a | yes |
| <a name="input_proxmox_api_token_id"></a> [proxmox\_api\_token\_id](#input\_proxmox\_api\_token\_id) | API Token Proxmox -> see credentials.auto.tfvars | `string` | n/a | yes |
| <a name="input_proxmox_api_token_secret"></a> [proxmox\_api\_token\_secret](#input\_proxmox\_api\_token\_secret) | API Token Secret Proxmox -> see credentials.auto.tfvars | `string` | n/a | yes |
| <a name="input_proxmox_api_url"></a> [proxmox\_api\_url](#input\_proxmox\_api\_url) | API URL Proxmox -> see credentials.auto.tfvars | `string` | n/a | yes |
| <a name="input_vm_cpu_type"></a> [vm\_cpu\_type](#input\_vm\_cpu\_type) | VM CPU Type -> see yaml files and compare with OS List and your hardware | `string` | `"x86-64-v3"` | no |
| <a name="input_vm_cpus"></a> [vm\_cpus](#input\_vm\_cpus) | VM Cores -> see yaml files | `number` | `"2"` | no |
| <a name="input_vm_diskspace"></a> [vm\_diskspace](#input\_vm\_diskspace) | VM Diskscape -> see yaml files | `string` | `"30G"` | no |
| <a name="input_vm_memory"></a> [vm\_memory](#input\_vm\_memory) | VM Memory -> see yaml files | `number` | `"4096"` | no |
| <a name="input_vm_name"></a> [vm\_name](#input\_vm\_name) | VM Name -> see yaml files | `string` | `"testvm2"` | no |
| <a name="input_vm_net"></a> [vm\_net](#input\_vm\_net) | VM Network Name -> see yaml files | `string` | `"lan"` | no |
| <a name="input_vm_pci_device"></a> [vm\_pci\_device](#input\_vm\_pci\_device) | VM PCI Device -> see yaml files currently not enabled in 01-vm\_rocky.tf, if you do that you have to set variables for all VMs in the yaml files | `bool` | `false` | no |
| <a name="input_vm_pcie"></a> [vm\_pcie](#input\_vm\_pcie) | VM PCIe express -> see yaml files currently not enabled in 01-vm\_rocky.tf, if you do that you have to set variables for all VMs in the yaml files | `bool` | `false` | no |
| <a name="input_vm_primary_gpu"></a> [vm\_primary\_gpu](#input\_vm\_primary\_gpu) | VM primary GPU -> see yaml files currently not enabled in 01-vm\_rocky.tf, if you do that you have to set variables for all VMs in the yaml files | `bool` | `false` | no |
| <a name="input_vm_raw_id"></a> [vm\_raw\_id](#input\_vm\_raw\_id) | VM PCI RAW-Device-id -> see yaml files currently not enabled in 01-vm\_rocky.tf, if you do that you have to set variables for all VMs in the yaml files | `string` | `""` | no |
| <a name="input_vm_rombar"></a> [vm\_rombar](#input\_vm\_rombar) | VM PCI vm\_rombar -> see yaml files currently not enabled in 01-vm\_rocky.tf, if you do that you have to set variables for all VMs in the yaml files | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vm_info"></a> [vm\_info](#output\_vm\_info) | Name, IP und VMID aller VMs |
<!-- END_TF_DOCS -->