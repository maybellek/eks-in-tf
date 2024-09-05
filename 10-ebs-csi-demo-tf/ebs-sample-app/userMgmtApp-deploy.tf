resource "kubernetes_deployment_v1" "mysql_deploy" {

depends_on = [ kubernetes_deployment_v1.mysql_deploy ]
  metadata {
    name = "usermgmt-webapp"
    labels = {
        app = "usermgmt-webapp"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "usermgmt-webapp"
      }
    }

    template {
      metadata {
        labels = {
          app = "usermgmt-webapp"
        }
      }

      spec {
        container {
          image = "stacksimplify/kube-usermgmt-webapp:1.0.0-MySQLDB"
          name  = "usermgmt-webapp"
          image_pull_policy = "Always"
          env {
            name = "DB_HOSTNAME"
            value = kubernetes_service_v1.mysql_clusterip_svc.metadata.0.name
          }
          env {
            name = "DB_PORT"
            value = kubernetes_service_v1.mysql_clusterip_svc.spec.0.port.0.port
          }
          env {
                name = "DB_NAME"
                value = "webappdb"
            }
            env {
              name = "DB_USERNAME"
              value = "root"
            }
            env {
              name = "DB_PASSWORD"
              value = kubernetes_deployment_v1.mysql_deploy.spec.0.template.0.spec.0.container.0.env.0.value
            }
            
          port {
            container_port = 8080
          }
        }
      }
    }
  }
}