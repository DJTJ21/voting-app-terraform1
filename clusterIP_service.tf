resource "kubernetes_service" "clusterIP" {
  for_each = var.clusterIP

  metadata {
    labels = {
      app = each.key
    }
    name = each.key
  }

  spec {
    type = "ClusterIP"

    port {
      name       = each.value.service_name
      port       = each.value.port
      target_port = each.value.target_port
    }

    selector = {
      app = each.key
    }
  }
}