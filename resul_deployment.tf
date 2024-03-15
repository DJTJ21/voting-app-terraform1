
resource "kubernetes_deployment" "result" {
  metadata {
    labels = {
      app = var.result_name
    }
    name = var.result_name
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = var.result_name
      }
    }

    template {
      metadata {
        labels = {
          app = var.result_name
        }
      }

      spec {
        container {
          image = var.result_image
          name  = var.result_name

          port {
            container_port = var.result_container_port
            name           = var.result_name
          }
        }
      }
    }
  }
}
