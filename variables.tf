variable "cluster_name" {
    description = "The name of the cluster, unique within the project and zoneData"
}

variable "project_id" {
    description = "The project in which the cluster will exist"
}

variable "region_name" {
    description = "The region in which the cluster and associated nodes will be created in"
}

variable "labels" {
    description = "The list of labels (key/value pairs) to be applied to instances in the cluster"
    default     = {}
}

variable "staging_bucket" {
    description = "The Cloud Storage staging bucket used to stage files, such as Hadoop jars, between client machines and the cluster"
    default =   ""
}

variable "cluster_availability_mode" {
    description = "Specifies if cluster is HA (replaces num_instances; values: single, ha)"
    default     = "single"
}

variable "master_machine_type" {
    description = "The name of a Google Compute Engine machine type to create for the master"
    default     = "n1-standard-1"
}

variable "master_boot_disk_size_gb" {
    description = "Size of the primary disk attached to each node, specified in GB"
    default     = 20
}

variable "master_boot_disk_type" {
    description = "The type of the boot disk. The value must be pd-standard or pd-ssd"
    default = "pd-standard"
}

variable "worker_num_instances" {
    description = "Specifies the number of worker nodes to create"
    default     = 2
}

variable "worker_machine_type" {
    description = "The name of a Google Compute Engine machine type to create for the worker nodes"
    default     = "n1-standard-1"
}

variable "worker_boot_disk_size_gb" {
    description = "Size of the primary disk attached to each worker node, specified in GB"
    default     = 20
}

variable "worker_boot_disk_type" {
    description = "The type of the boot disk. The value must be pd-standard or pd-ssd"
    default     = "pd-standard"
}

variable "worker_num_local_ssds" {
    description = "The amount of local SSD disks that will be attached to each worker cluster node"
    default     = 0
}

variable "preemptible_num_instances" {
    description = "Specifies the number of preemptible nodes to create"
    default     = 0
}

variable "preemptible_worker_boot_disk_size_gb" {
    description = "Size of the primary disk attached to each worker node, specified in GB"
    default     = 20
}

/* not yet supported
variable "preemptible_worker_boot_disk_type" {
    description = "The type of the boot disk. The value must be pd-standard or pd-ssd"
    default     = "pd-standard"
}*/

variable "override_properties" {
    description = "Specifies configuration properties for installed packages, such as Hadoop and Spark."
    default = {}
}

variable "default_override_properties" {
    description = "Module defaults for override_properties"
    default = {
      "dataproc:dataproc.allow.zero.workers" = "true"
    }
}

variable "zone" {
    description = "The compute zone (e.g. us-central1-a) for the cluster."
    default = ""
}

variable "subnetwork" {
    description = "Specifies the subnet that the cluster will be part of."
}

variable "image_version" {
    description = "The Cloud Dataproc image version to use for the clustere. Use a specific version to avoid cluster re-creation on config changes (ie. 1.3.16-deb9)"
    default     = ""
}
