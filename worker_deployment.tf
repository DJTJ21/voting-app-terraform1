resource "kubernetes_deployment" "worker" {
  metadata {
    labels = {
      app = var.worker_name
    }
    name = var.worker_name
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = var.worker_name
      }
    }

    template {
      metadata {
        labels = {
          app = var.worker_name
        }
      }

      spec {
        container {
          image = var.worker_container_image
          name  = var.worker_name
        }
      }
    }
  }
}
