resource "kubernetes_config_map_v1" "usermgmt_dbcreation_script" {
  metadata {
    name = "usermanagement-dbcreation-script"
  }

  data = {
    "my_config_file.yml" = "${file("${path.module}/webappdb.sql")}"
  }
}