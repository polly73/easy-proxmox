terraform {
  required_providers {
    proxmox = {
    source = "telmate/proxmox"
#    version = "3.0.1-rc6"
#    version = "3.0.1-rc9"    
     version = "3.0.2-rc01"
                }
     time = {
      source  = "time"
      version = "0.9.1"
    }
    utils = {
      source  = "netascode/utils"
      version = ">= 0.1.3"
    }               
  }
}

provider "proxmox" {
  pm_api_url= var.proxmox_api_url
  pm_api_token_id = var.proxmox_api_token_id
  pm_api_token_secret = var.proxmox_api_token_secret
  pm_tls_insecure = true
}
