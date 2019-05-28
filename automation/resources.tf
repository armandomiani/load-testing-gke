resource "google_container_cluster" "locust" {
  name = "load-testing-gke"
  location = "us-west1-a"
  initial_node_count = "3"
  
  addons_config {
    horizontal_pod_autoscaling {
        disabled = false
    }

    http_load_balancing {
        disabled = false
    }

  }

  node_locations = [
      "us-west1-b"
  ]

# empty username and password disables basic auth
  master_auth {
      username = "",
      password = ""
  }

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/cloud-platform"
    ]

    labels {
      this-is-for = "dev-cluster"
    }

    tags = ["load-testing"]
  }
}


data "google_container_registry_repository" "kubernetes" {
    region = "us"
}