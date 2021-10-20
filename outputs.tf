output "cloud_run_endpoint" {
  value = google_cloud_run_service.whats-the-word.status[0]["url"]
}