variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
  default     = "mkcluster"
}

variable "cluster_service_ipv4_cidr" {
  description = "Service ipv4 cidr for the kubernetes cluster"
  type        = string
  default     = null
}

variable "cluster_version" {
  description = "Kubernetes version for the EKS cluster"
  type = string
  default     = null
}
variable "cluster_endpoint_private_access" {
  description = "Indicates Amazon EKS private API server endpoint enabled status."
  type        = bool
  default     = false
}

variable "cluster_endpoint_public_access" {
  description = "Indicates Amazon EKS public API server endpoint enabled status."
  type        = bool
  default     = true
}

variable "cluster_endpoint_public_access_cidrs" {
  description = "List of CIDR blocks which can access the Amazon EKS public API server endpoint."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}