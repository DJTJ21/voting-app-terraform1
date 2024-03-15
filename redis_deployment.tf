
resource "kubernetes_deployment" "redis" {
  metadata {
    labels = {
      app = var.redis_name
    }
    name = var.redis_name
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = var.redis_name
      }
    }

    template {
      metadata {
        labels = {
          app = var.redis_name
        }
      }

      spec {
        container {
          image = var.redis_image
          name  = var.redis_name

          port {
            container_port = var.redis_port
            name           = var.redis_name
          }

          volume_mount {
            mount_path = "/data"
            name       = "redis-data"
          }
        }

        volume {
          name     = "redis-data"
          empty_dir {}
        }
      }
    }
  }
}
