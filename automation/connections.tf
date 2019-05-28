provider "google" {
  credentials = "${file("../keys/gcloud-automation.json")}"
  project = "miani-gcloud"
  region = "us-west1"
}

