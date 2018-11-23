output "dataproc_master_instance_names" {
    description = "List of master instance names which have been assigned to the cluster"
    value = "${join(",", google_dataproc_cluster.this.cluster_config.0.master_config.0.instance_names)}"
}

output "dataproc_worker_instance_names" {
  description = "List of worker instance names which have been assigned to the cluster"
  value = "${var.worker_num_instances > 0 ? join(",", google_dataproc_cluster.this.cluster_config.0.worker_config.0.instance_names) : ""}"
}

output "dataproc_preemptible_worker_instance_names" {
  description = "List of preemptible woreker instance names which ave been assigned to the cluster"
  value = "${var.preemptible_num_instances > 0 ? join(",", google_dataproc_cluster.this.cluster_config.0.preemptible_worker_config.0.instance_names) : ""}"
}

