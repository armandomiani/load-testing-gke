resource "google_storage_bucket" "log_store" {
  name     = "gmiani-load-test-bucket"
  location = "US"
}