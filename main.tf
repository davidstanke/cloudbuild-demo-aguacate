resource "google_cloud_run_service" "us_covid_stats" {
  name     = "us-covid-stats"
  location = var.google_region

  template {
    spec {
      containers {
        image = "gcr.io/${var.google_project_id}/us-covid-stats"
      }
    }
  }

  metadata {
    labels = {
      "foo" : "yext"
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
  service  = "us-covid-stats"

  role       = "roles/run.invoker"
  members    = ["allUsers"]
  depends_on = [google_cloud_run_service.us_covid_stats]
}
