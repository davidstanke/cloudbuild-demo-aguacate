resource "google_cloud_run_service" "whats-the-word" {
  name     = "whats-the-word"
  location = var.google_region

  template {
    spec {
      containers {
        image = "gcr.io/${var.google_project_id}/whats-the-word"
        env {
            name = "APP_HEADER"
            value = "Where are the spatulas?"
        }
      }
    }
  }

  metadata {
    labels = {
      "beep" : "boop"
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }

  autogenerate_revision_name = true
}

resource "google_cloud_run_service_iam_binding" "noauth" {
  location = var.google_region
  project  = var.google_project_id
  service  = "whats-the-word"

  role       = "roles/run.invoker"
  members    = ["allUsers"]
  depends_on = [google_cloud_run_service.whats-the-word]
}
