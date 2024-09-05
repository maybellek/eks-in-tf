output "ebs_csi_helm_metadata" {
  description = "Metadata block showing deployed release status"
  value = helm_release.ebs_csi_driver.metadata
}