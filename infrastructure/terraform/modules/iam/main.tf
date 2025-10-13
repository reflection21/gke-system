resource "google_service_account" "node_pool" {
  account_id   = "node-pool"
  display_name = "Service Account for gke node pool"
}

resource "google_project_iam_member" "gke_nodes_extra" {
  for_each = toset([
    "roles/logging.logWriter",
    "roles/monitoring.metricWriter",
    "roles/container.nodeServiceAccount",
    "roles/compute.instanceAdmin.v1",
    "roles/iam.serviceAccountUser"
  ])
  project = var.project_id
  role    = each.value
  member  = "serviceAccount:${google_service_account.node_pool.email}"
}

resource "google_service_account" "bastion_host" {
  account_id   = "bastion-host"
  display_name = "Service Account for bastion host"
}

resource "google_project_iam_member" "cluster_admin" {
  for_each = toset([
    "roles/container.admin",
    "roles/storage.objectAdmin",
    "roles/iam.serviceAccountUser"
  ])

  project = var.project_id
  role    = each.value
  member  = "serviceAccount:${google_service_account.bastion_host.email}"
}
