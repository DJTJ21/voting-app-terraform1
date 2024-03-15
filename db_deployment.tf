
resource "kubernetes_deployment" "db" {
  metadata {
    labels = {
      app = var.db_name
    }
    name = var.db_name
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = var.db_name
      }
    }

    template {
      metadata {
        labels = {
          app = var.db_name
        }
      }

      spec {
        container {
          image = var.postgres_image
          name  = "postgres"

          env {
            name  = "POSTGRES_USER"
            value = var.postgres_user
          }

          env {
            name  = "POSTGRES_PASSWORD"
            value = var.postgres_password
          }

          port {
            container_port = var.postgres_container_port
            name           = "postgres"
          }

          volume_mount {
            mount_path = "/var/lib/postgresql/data"
            name       = "db-data"
          }
        }

        volume {
          name     = "db-data"
          empty_dir {}
        }
      }
    }
  }
}
