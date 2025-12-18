terraform {
  backend "http" {
    address        = "https://gitlab.home.tinytip.de/api/v4/projects/10/terraform/state/main" # Replace with your GitLab URL, gitlab project ID and Branch
    lock_address   = "https://gitlab.home.tinytip.de/api/v4/projects/10/terraform/state/main/lock" # Replace with your GitLab URL, gitlab project ID and Branch
    unlock_address = "https://gitlab.home.tinytip.de/api/v4/projects/10/terraform/state/main/lock" # Replace with your GitLab URL, gitlab project ID and Branch
    username       = var.gitlab_username # Replace with your GitLab username
    password       = var.gitlab_token # Replace with your GitLab Personal Access Token
    lock_method    = "POST"
    unlock_method  = "DELETE"
    retry_wait_max = 5    
    description = "backend for my gitlab, if you want lokal terraform.state.files, then comment this out"
  }

}