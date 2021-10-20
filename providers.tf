terraform {
  required_version = ">= 0.15"
  backend "gcs" {} # gcs backend config should be passed to the `init` command
  required_providers {
    google = {
      version = ">= 3.70.0"
    }
  }
}

provider "google" {
  project = var.google_project_id
  region  = var.google_region
}