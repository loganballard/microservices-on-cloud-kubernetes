provider "google" {
  credentials = file("${path.module}/../credentials/terraform-user.json")
  project     = "k8s-monitoring-project"
  region      = "us-west1"
}

resource "google_project" "k8s_monitoring_project" {
  name       = "k8s-monitoring-project"
  project_id = "k8s-monitoring-project"
  org_id     = "0"
}

resource "google_service_account" "k8s_user_service_acct" {
  account_id   = "k8s-admin-bot"
  display_name = "k8s-admin-bot"
  project = google_project.k8s_monitoring_project.project_id
}

// TODO - role binding here
