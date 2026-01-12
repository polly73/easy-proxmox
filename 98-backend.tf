terraform {
  backend "http" {
    address        = "https://${var.gitlab-url}/api/v4/projects/${var.gitlab-project-id}/${var.gitlab-group}/state/main"
    lock_address   = "https://${var.gitlab-url}/api/v4/projects/${var.gitlab-project-id}/${var.gitlab-group}/state/main/lock"
    unlock_address = "https://${var.gitlab-url}/api/v4/projects/${var.gitlab-project-id}/${var.gitlab-group}/main/lock"
    username       = var.gitlab_username # Replace with your gitlab username
    password       = var.gitlab_token # Replace with your gitlab Personal Access Token
    lock_method    = "POST"
    unlock_method  = "DELETE"
    retry_wait_max = 5    
#    description = "backend for my gitlab, if you want lokal terraform.state.files, then comment this out"
  }

}