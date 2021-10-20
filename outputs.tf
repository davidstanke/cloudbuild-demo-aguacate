output "cloud_run_endpoint" {
  value = google_cloud_run_service.us_covid_stats.status[0]["url"]
}