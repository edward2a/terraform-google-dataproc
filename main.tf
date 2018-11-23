locals {
  cluster_availability_mode = {
    ha = 3
    single = 1
  }
}

resource "google_dataproc_cluster" "this" {
    timeouts {
      create = "20m"
    }

    name    = "${var.cluster_name}"
    project = "${var.project_id}"
    region  = "${var.region_name}"

    labels  = "${var.labels}"

    cluster_config {

        staging_bucket        = "${var.staging_bucket}"

        master_config {
            num_instances     = "${local.cluster_availability_mode[var.cluster_availability_mode]}"
            machine_type      = "${var.master_machine_type}"
            disk_config {
                boot_disk_size_gb = "${var.master_boot_disk_size_gb}"
                boot_disk_type    = "${var.master_boot_disk_type}"
            }
        }

        worker_config {
            num_instances     = "${var.worker_num_instances}"
            machine_type      = "${var.worker_machine_type}"
            disk_config {
                boot_disk_size_gb = "${var.worker_boot_disk_size_gb}"
                boot_disk_type    = "${var.worker_boot_disk_type}"
                num_local_ssds    = "${var.worker_num_local_ssds}"
            }
        }

        preemptible_worker_config {
            num_instances     = "${var.preemptible_num_instances}"
            disk_config {
                boot_disk_size_gb = "${var.preemptible_worker_boot_disk_size_gb}"
                /* not yet supported
                boot_disk_type    = "${var.preemptible_worker_boot_disk_type}" */
            }
        }


        /* Override or set some custom properties */
        software_config {
            image_version       = "${var.image_version}"
            override_properties = "${merge(var.default_override_properties, var.override_properties)}"
        }

        gce_cluster_config {
            zone    = "${var.zone}"
            subnetwork = "${var.subnetwork}"
            internal_ip_only = "${var.internal_ip_only}"

            #TODO
            #tags    = ["foo", "bar"]
        }

    }

}
