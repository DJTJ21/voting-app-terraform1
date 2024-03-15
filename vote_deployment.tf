
resource "kubernetes_deployment" "vote" {
  metadata {
    labels = {
      app = var.vote_name
    }
    name = var.vote_name
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = var.vote_name
      }
    }

    template {
      metadata {
        labels = {
          app = var.vote_name
        }
      }

      spec {
        container {
          image = var.vote_container_image
          name  = var.vote_name

          port {
            container_port = var.vote_container_port
            name           = var.vote_name
          }
        }
      }
    }
  }
}
