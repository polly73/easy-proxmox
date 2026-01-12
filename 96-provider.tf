terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      #    version = "3.0.2-rc03"
      version = " 3.0.2-rc06"
    }
    time = {
      source  = "time"
      version = "0.9.1"
    }
    utils = {
      source  = "netascode/utils"
      version = ">= 0.1.3"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
    netbox = {
      source  = "e-breuninger/netbox"
      version = "~> 4.0"
    }
  }
}

provider "proxmox" {
  pm_api_url                  = var.proxmox_api_url
  pm_api_token_id             = var.proxmox_api_token_id
  pm_api_token_secret         = var.proxmox_api_token_secret
  pm_tls_insecure             = true
  pm_minimum_permission_check = false
}


provider "netbox" {
  server_url = var.netbox_url   # z.B. "https://netbox.home.tinytip.de"
  api_token  = var.netbox_token # API-Token aus NetBox
}
